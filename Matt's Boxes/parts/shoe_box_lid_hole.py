from nurb import *


@part
def shoe_box_lid_hole(
    length=170.0,
    width=110.0,
    wall=2.0,
    lid_depth=25.0,
    fit_gap=0.3,
    corner_radius=10.0,
    hole_diameter=88.0,
    hole_length=136.0,
    draft=False,
):
    """
    length: inside length of the matching box (must match its length)
    width: inside width of the matching box (must match its width)
    wall: wall thickness of the matching box (must match its wall)
    lid_depth: how far the lid's sides reach down over the box
    fit_gap: extra room per side so the lid slips over the box without binding
    corner_radius: how rounded the lid's four vertical corners are; past 8mm resists warping on this big a first layer
    hole_diameter: width of the hole through the middle of the lid's top; 0 leaves the top solid
    hole_length: end-to-end length of the hole; equal to hole_diameter for a round hole, bigger to stretch it into an oblong slot
    """
    if hole_diameter > 0.8 * width:
        reject(f"hole_diameter {hole_diameter} is too big for a lid {width}mm wide; keep it under {0.8 * width:.1f} (80% of the width)", param="hole_diameter")
    if hole_diameter > 0 and hole_length < hole_diameter:
        reject(f"hole_length {hole_length} can't be shorter than hole_diameter {hole_diameter}", param="hole_length")
    if hole_diameter > 0 and hole_length > 0.8 * length:
        reject(f"hole_length {hole_length} is too long for a lid {length}mm long; keep it under {0.8 * length:.1f} (80% of the length)", param="hole_length")
    # Modelled cap-down, sides open upward, the same shape as an open box: it
    # prints flat with no bridging, then gets flipped onto the box to use.
    outer = Box(
        length + 4 * wall + 2 * fit_gap,
        width + 4 * wall + 2 * fit_gap,
        lid_depth + wall,
        align=(Align.CENTER, Align.CENTER, Align.MIN),
    )
    # Rounding the plan corners turns the peel front from a point into a curve,
    # which is what a first layer this size needs (nurb check: warp_risk).
    outer = fillet(outer.edges().filter_by(Axis.Z), radius=corner_radius)
    top = outer.faces().sort_by(Axis.Z)[-1]
    body = offset(outer, amount=-wall, openings=top)
    # The cap is at the bed in this orientation; it becomes the lid's visible top once
    # flipped onto the box, so the hole only needs to cut through its thickness (wall).
    bed = body.bounding_box().min.Z
    if hole_diameter > 0:
        with BuildPart() as hp:
            with BuildSketch(Plane.XY):
                SlotOverall(hole_length, hole_diameter)
            extrude(amount=wall + 2)
        body -= hp.part.moved(Location((0, 0, bed - 1)))
    if draft:
        return body
    # Name what must stay sharp, then let `polish` chamfer whatever the kernel takes.
    # A bare `chamfer(...)` is all or nothing: one edge that cannot land loses the lot.
    bed = body.bounding_box().min.Z
    concave = concave_edges(body)
    keep = body.edges().filter_by(lambda e: e.bounding_box().min.Z > bed and e not in concave)
    return polish(body, keep, 1.0)
