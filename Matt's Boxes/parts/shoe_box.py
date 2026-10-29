from nurb import *


@part
def shoe_box(length=170.0, width=110.0, height=60.0, wall=2.0, corner_radius=10.0, draft=False):
    """
    length: inside length of the box, front to back
    width: inside width of the box, side to side
    height: inside height of the box
    wall: thickness of the floor and side walls
    corner_radius: how rounded the box's four vertical corners are, so the first layer's peel front is a curve instead of a point
    """
    if height > 240.0:
        reject(f"height {height} is over the 240mm cap; keep it at or under 240", param="height")
    outer = Box(
        length + 2 * wall, width + 2 * wall, height + wall,
        align=(Align.CENTER, Align.CENTER, Align.MIN),
    )
    outer = fillet(outer.edges().filter_by(Axis.Z), radius=corner_radius)
    top = outer.faces().sort_by(Axis.Z)[-1]
    body = offset(outer, amount=-wall, openings=top)
    if draft:
        return body
    # Name what must stay sharp, then let `polish` chamfer whatever the kernel takes.
    # A bare `chamfer(...)` is all or nothing: one edge that cannot land loses the lot.
    bed = body.bounding_box().min.Z
    concave = concave_edges(body)
    keep = body.edges().filter_by(lambda e: e.bounding_box().min.Z > bed and e not in concave)
    return polish(body, keep, 1.0)
