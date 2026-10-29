import math

from nurb import *

# Gridfinity specification (gridfinity.xyz), recorded with provenance in
# measurements.toml: grid pitch, per-bin clearance, and the chamfered
# stacking-foot profile (bottom chamfer / vertical collar / top chamfer)
# every compatible bin has on its underside.
GRID_PITCH = measured("gridfinity_pitch")
GRID_CLEARANCE = measured("gridfinity_clearance")
FOOT_CORNER = measured("gridfinity_foot_corner_radius")
FOOT_BOTTOM_CHAMFER = measured("gridfinity_foot_bottom_chamfer")
FOOT_WALL = measured("gridfinity_foot_wall")
FOOT_TOP_CHAMFER = measured("gridfinity_foot_top_chamfer")
FOOT_HEIGHT = FOOT_BOTTOM_CHAMFER + FOOT_WALL + FOOT_TOP_CHAMFER
HALF_PITCH = GRID_PITCH / 2


def gridfinity_foot_size(outer_dim):
    """
    Rounds an outer footprint dimension up to the nearest whole-or-half
    Gridfinity cell (42mm or 21mm steps), then gives back the foot size a
    bin that wide actually prints at (one cell clearance narrower than the
    grid it occupies). Never rounds down, so the foot always has at least
    as much grid under it as the box needs.
    """
    cells = max(1, math.ceil((outer_dim + GRID_CLEARANCE) / HALF_PITCH))
    return cells * HALF_PITCH - GRID_CLEARANCE


def round_over(shape, edges, size):
    """Round as much of `edges` as will land, and stop there.

    The rounded-corner twin of nurb's own `polish`: same one-batch-can't-sink-
    the-rest retry, but filleting instead of chamfering, for the edges that
    are meant to be rolled over rather than beveled flat.
    """
    kept, best = [], shape

    def lands(batch):
        try:
            return fillet(kept + batch, size)
        except Exception:
            return None

    def take(batch):
        nonlocal kept, best
        out = lands(batch)
        if out is not None:
            kept.extend(batch)
            best = out
            return
        if len(batch) == 1:
            return
        half = len(batch) // 2
        take(batch[:half])
        take(batch[half:])

    take(sorted(edges, key=lambda e: (-e.length, e.center().X, e.center().Y, e.center().Z)))
    return best


def bag_dispenser_body(
    length, width, height, wall, front_height, gap_fraction, corner_radius, ramp_length, ramp_radius, draft
):
    """
    The shared shape behind every bag dispenser size (big, midi, ickle): an
    open-top box with a notch in the front wall to pull bags through, and a
    ramp that lifts the cavity floor to meet the bottom edge of that notch so
    nothing catches on a lip sliding out. Only the dimensions differ between
    sizes, so this is the one copy of the shape and each size's own file is
    just its own set of dimensions.
    """
    if front_height >= height:
        reject(f"front_height {front_height} is not below height {height}: lower front_height or raise height", param="front_height")
    if gap_fraction <= 0 or gap_fraction >= 1:
        reject(f"gap_fraction {gap_fraction} must be between 0 and 1", param="gap_fraction")
    pillar = wall + width * (1 - gap_fraction) / 2
    if pillar < corner_radius + wall:
        reject(
            f"gap_fraction {gap_fraction} leaves only {pillar:.1f}mm of wall beside the opening, "
            f"and the {corner_radius}mm corner rounding eats into that: lower gap_fraction or corner_radius",
            param="gap_fraction",
        )
    if ramp_length <= 0 or ramp_length > length:
        reject(f"ramp_length {ramp_length} must be between 0 and length {length}", param="ramp_length")
    if ramp_radius < 0:
        reject(f"ramp_radius {ramp_radius} must be 0 or more", param="ramp_radius")
    # Below this, the arc swings past the floor it's supposed to land flush on,
    # which can split the ramp into a disconnected sliver instead of one solid.
    min_ramp_radius = 1.1 * (ramp_length**2 + front_height**2) / (2 * front_height)
    if ramp_radius > 0 and ramp_radius < min_ramp_radius:
        reject(
            f"ramp_radius {ramp_radius} is too tight to curve a {ramp_length}mm ramp rising {front_height}mm "
            f"without swinging past the floor: raise it above {min_ramp_radius:.0f}mm, or set it to 0 for a straight ramp",
            param="ramp_radius",
        )

    outer_width = width + 2 * wall
    outer_depth = length + 2 * wall
    outer_height = height + wall

    outer = Box(outer_width, outer_depth, outer_height, align=(Align.CENTER, Align.CENTER, Align.MIN))
    outer = fillet(outer.edges().filter_by(Axis.Z), radius=corner_radius)
    top = outer.faces().sort_by(Axis.Z)[-1]
    body = offset(outer, amount=-wall, openings=top)

    # The side walls run full height all the way to the front; only the front wall
    # itself is notched, so the cutter punches through its thickness and no deeper.
    overshoot = 5.0
    gap_width = gap_fraction * width
    front_y = -outer_depth / 2
    cutter = Box(
        gap_width,
        wall + 2 * overshoot,
        outer_height - (wall + front_height) + overshoot,
        align=(Align.CENTER, Align.MIN, Align.MIN),
    )
    cutter = Pos(0, front_y - overshoot, wall + front_height) * cutter
    body = body - cutter

    # A ramp fills in the cavity floor near the front, rising from the ordinary
    # floor level up to the exact height of the opening's lower edge, so there is
    # no lip for an item to catch on sliding out.
    floor_top = wall
    sill_top = wall + front_height
    y_front = -length / 2
    y_ramp_back = y_front + ramp_length
    lift_point = (y_ramp_back, floor_top)
    sill_point = (y_front, sill_top)
    if ramp_radius > 0:
        slope = RadiusArc(lift_point, sill_point, ramp_radius, short_sagitta=True)
        ramp_wire = Curve() + [
            Line(lift_point, (y_front, floor_top)),
            Line((y_front, floor_top), sill_point),
            slope,
        ]
        ramp_profile = Plane.YZ * make_face(ramp_wire)
    else:
        ramp_profile = Plane.YZ * Polygon(lift_point, (y_front, floor_top), sill_point)
    raw_ramp = extrude(ramp_profile, amount=width)
    ramp = Pos(-raw_ramp.bounding_box().center().X, 0, 0) * raw_ramp
    body = body + ramp

    if draft:
        return body
    # Name what must stay sharp, then let `round_over` fillet whatever the kernel takes.
    # A bare `fillet(...)` is all or nothing: one edge that cannot land loses the lot.
    bed = body.bounding_box().min.Z
    concave = concave_edges(body)
    keep = body.edges().filter_by(lambda e: e.bounding_box().min.Z > bed and e not in concave)
    return round_over(body, keep, 1.0)


def tweazer_tray_body(length, width, height, wall, inside_round, outer_round, draft):
    """
    The tweezer tray's own shape: a rounded-rectangle tub with a rounded
    inside floor. Pulled out here so it can be built directly by name, not
    only through its own part file, which is what lets drawer_layout build
    it as part of one printable solid instead of a separate exported piece.
    """
    if wall * 2 >= width:
        reject(f"wall {wall} is too thick for width {width}: the inside would close up. Lower wall or raise width", param="wall")
    if wall >= height:
        reject(f"wall {wall} must be less than height {height}, to leave room for the inside", param="wall")
    max_outer_round = min(length, width) / 2 - 0.1
    if outer_round > max_outer_round:
        reject(
            f"outer_round {outer_round} is too big for a {length}mm x {width}mm tray: lower it below {max_outer_round:.1f}",
            param="outer_round",
        )

    inner_width = width - 2 * wall
    inner_length = length - 2 * wall
    inner_height = height - wall
    max_round = min(inner_width / 2, inner_height) - 0.5
    if inside_round > max_round:
        reject(
            f"inside_round {inside_round} is too big for a {width}mm wide, {height}mm tall tray with {wall}mm walls: "
            f"lower it below {max_round:.1f}, or widen/raise the tray",
            param="inside_round",
        )

    inner_corner = max(min(inside_round, inner_width / 2 - 0.5, inner_length / 2 - 0.5), 0.1)

    body = extrude(RectangleRounded(length, width, outer_round), amount=height)

    floor_top = wall
    cavity_top = height + 1.0
    with BuildPart() as cp:
        with BuildSketch(Plane.XY.offset(cavity_top)):
            RectangleRounded(inner_length, inner_width, inner_corner)
        extrude(amount=-(cavity_top - floor_top))
        bottom_edges = cp.part.edges().filter_by(lambda e: abs(e.bounding_box().max.Z - floor_top) < 1e-3)
        fillet(bottom_edges, radius=inside_round)
    body = body - cp.part

    if draft:
        return body
    bed = body.bounding_box().min.Z
    concave = concave_edges(body)
    keep = body.edges().filter_by(lambda e: e.bounding_box().min.Z > bed and e not in concave)
    return round_over(body, keep, 1.0)
