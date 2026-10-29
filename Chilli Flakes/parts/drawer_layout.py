from nurb import *
from system import bag_dispenser_body, tweazer_tray_body


@part
def drawer_layout(gap_between_boxes=0.0, gap_to_tray=0.0, box_height=103.0, tray_height=7.0, draft=False):
    """
    gap_between_boxes: how much space is left between each bag box, left to right
    gap_to_tray: how much space is left between the tweezer tray and the row of boxes
    box_height: how tall the three bag boxes stand, outside height, all three the same
    tray_height: how tall the tweezer tray stands on the outside
    """
    # Each box's own wall thickness eats into its standing height, so the box
    # builder (which takes the height of its inside cavity) gets that wall
    # thickness subtracted back off box_height. That is what makes box_height
    # the actual, equal, outside height of all three boxes rather than just
    # their shared inside depth, which used to leave the thicker-walled big
    # box 0.6mm taller than the other two for the same slider value.
    big_wall, midi_wall, ickle_wall = 3.0, 2.4, 2.4
    big = bag_dispenser_body(98.0, 83.0, box_height - big_wall, big_wall, 7.0, 0.5, 8.0, 25.0, 130.0, draft)
    midi = bag_dispenser_body(70.0, 55.0, box_height - midi_wall, midi_wall, 7.0, 0.5, 8.0, 7.4, 10.0, draft)
    ickle = bag_dispenser_body(40.0, 35.0, box_height - ickle_wall, ickle_wall, 7.0, 0.5, 8.0, 7.4, 10.0, draft)
    tray = tweazer_tray_body(188.6, 41.5, tray_height, 2.5, 4.0, 8.0, draft)

    # Left to right, large to small. Each box is centered on its own middle in X,
    # and shifted in Y so its front face (where the bag opening is) lines up with
    # every other box's front face along one straight line.
    boxes = [big, midi, ickle]
    widths = [b.bounding_box().size.X for b in boxes]
    depths = [b.bounding_box().size.Y for b in boxes]
    heights = [b.bounding_box().size.Z for b in boxes]

    # Neighbours are pulled 0.3mm into each other so their own (rounded)
    # shapes actually overlap at the seam, rather than just touching along a
    # face. A synthetic connector tab would have to be straight-edged and so
    # would poke past each box's rounded corner; overlapping the real shapes
    # instead fuses them cleanly with nothing protruding.
    weld = 0.3

    row_width = sum(widths) + gap_between_boxes * (len(boxes) - 1)
    x = -row_width / 2
    placed = []
    for box, w, d in zip(boxes, widths, depths):
        cx = x + w / 2
        placed.append(Pos(cx, d / 2, 0) * box)
        x += w + gap_between_boxes - weld

    # The tweezer tray sits in front of that line, centered on the row.
    tray_size = tray.bounding_box().size
    tray_y = -(gap_to_tray - weld + tray_size.Y / 2)
    placed.append(Pos(0, tray_y, 0) * tray)

    welded = placed[0]
    for s in placed[1:]:
        welded = welded + s
    return welded
