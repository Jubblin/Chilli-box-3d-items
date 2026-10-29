from nurb import *
from system import tweazer_tray_body


@part
def tweazer_tray(
    length=188.6,
    width=41.5,
    height=7.0,
    wall=2.5,
    inside_round=4.0,
    outer_round=8.0,
    draft=False,
):
    """
    length: how long the tray is, end to end
    width: how wide the tray is, side to side
    height: how tall the tray stands on the outside
    wall: thickness of the floor and the outer wall
    inside_round: how rounded the curve is where the inside wall meets the inside floor
    outer_round: how rounded the tray's four outside corners are
    """
    return tweazer_tray_body(length, width, height, wall, inside_round, outer_round, draft)
