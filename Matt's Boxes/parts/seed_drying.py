from math import atan, degrees

from nurb import *

# How much of one box's height has to sink into the next one below for the stack to
# feel like it's actually nesting rather than just resting rim-on-rim.
MIN_NEST_SINK = 3.0


@part
def seed_drying(width=75.0, depth=75.0, height=20.0, wall=1.5, corner_radius=6.0, wall_angle=8.0, draft=False):
    """
    width: inside width of the box, side to side, measured at the floor
    depth: inside depth of the box, front to back, measured at the floor
    height: inside height of the box
    wall: thickness of the floor and side walls
    corner_radius: how rounded the box's four vertical corners are
    wall_angle: how many degrees the side walls lean outward going up, so an empty box's bottom drops into another one's open top for compact stacking
    """
    if height <= MIN_NEST_SINK:
        reject(f"height {height} is too short for two of these boxes to nest at all; raise height above {MIN_NEST_SINK}", param="height")
    required_angle = degrees(atan(wall / (height - MIN_NEST_SINK)))
    if wall_angle < required_angle:
        reject(f"wall_angle {wall_angle} is too shallow for two of these boxes to nest with height {height} and wall {wall}; raise wall_angle above {required_angle:.1f}", param="wall_angle")
    outer_w = width + 2 * wall
    outer_d = depth + 2 * wall
    outer_h = height + wall
    # Shelling a tapered solid with `offset` chokes on the sloped side faces, so the
    # cavity is its own tapered solid (same lean, wall thinner all round) and gets cut.
    with BuildPart() as bp:
        with BuildSketch(Plane.XY):
            RectangleRounded(outer_w, outer_d, corner_radius)
        extrude(amount=outer_h, taper=-wall_angle)
    outer = bp.part
    inner_radius = max(corner_radius - wall, 0.1)
    with BuildPart() as ip:
        with BuildSketch(Plane.XY.offset(wall)):
            RectangleRounded(width, depth, inner_radius)
        extrude(amount=height + wall, taper=-wall_angle)
    body = outer - ip.part
    if draft:
        return body
    # Name what must stay sharp, then let `polish` chamfer whatever the kernel takes.
    # A bare `chamfer(...)` is all or nothing: one edge that cannot land loses the lot.
    bed = body.bounding_box().min.Z
    concave = concave_edges(body)
    # Tolerance, not `> bed`: a tapered wall's bottom rim floats a hair off the exact
    # bed value from kernel float noise, and a bare `>` polishes that rim by mistake.
    keep = body.edges().filter_by(lambda e: e.bounding_box().min.Z > bed + 0.01 and e not in concave)
    return polish(body, keep, 1.0)
