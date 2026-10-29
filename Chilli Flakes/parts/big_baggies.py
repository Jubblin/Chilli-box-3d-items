from nurb import *
from system import bag_dispenser_body


@part
def bag_dispensers(
    length=98.0,
    width=83.0,
    height=100.0,
    wall=3.0,
    front_height=7.0,
    gap_fraction=0.5,
    corner_radius=8.0,
    ramp_length=25.0,
    ramp_radius=130.0,
    draft=False,
):
    """
    length: inside depth of the box, front to back
    width: inside width of the box, side to side
    height: inside height of the walls
    wall: thickness of the floor and side walls
    front_height: how tall the solid part of the front wall is, below the opening
    gap_fraction: how wide the opening in the front wall is, as a fraction of the box's width
    corner_radius: how rounded the box's four vertical corners are
    ramp_length: how far back from the front the floor ramps up to meet the opening, so items slide out instead of catching on a lip
    ramp_radius: how curved the ramp is where it lifts off the floor, instead of bending straight into the slope
    """
    return bag_dispenser_body(length, width, height, wall, front_height, gap_fraction, corner_radius, ramp_length, ramp_radius, draft)
