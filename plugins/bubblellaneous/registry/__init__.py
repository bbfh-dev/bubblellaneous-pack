from plugins.bubblellaneous.internal.category import Category
from plugins.bubblellaneous.internal.unit.base import Base
from plugins.bubblellaneous.registry.furniture import *
from plugins.bubblellaneous.registry.technology import *

REGISTRY: list[Base] = [
    BubbleBench(Category.FURNITURE),
    Table(Category.FURNITURE),
    Shelf(Category.FURNITURE),
    Cabinet(Category.FURNITURE),
    Drawer(Category.FURNITURE),
    Cupboard(Category.FURNITURE),
    Bench(Category.FURNITURE),
    Couch(Category.FURNITURE),
    Stool(Category.FURNITURE),
    Barstool(Category.FURNITURE),
    DinningChair(Category.FURNITURE),
    Blinds(Category.FURNITURE),
    KitchenCabinet(Category.FURNITURE),
    Fridge(Category.FURNITURE),
    Washer(Category.FURNITURE),
    Trashcan(Category.FURNITURE),
    TableLamp(Category.FURNITURE),
    StreetLight(Category.FURNITURE),
    DeskLamp(Category.FURNITURE),
    UpholsteryCouch(Category.FURNITURE),
    FloorLamp(Category.FURNITURE),
    Curtains(Category.FURNITURE),
    # ------
    Ladder(Category.TECHNOLOGY),
    PadlockBlock(Category.TECHNOLOGY),
    RisingDoor(Category.TECHNOLOGY),
    Pipe(Category.TECHNOLOGY),
    Radiator(Category.TECHNOLOGY),
    SurveillanceCamera(Category.TECHNOLOGY),
    SecurityMonitor(Category.TECHNOLOGY),
    Padlock(Category.TECHNOLOGY),
    Key(Category.TECHNOLOGY),
]
