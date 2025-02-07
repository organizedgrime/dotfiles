from ignis.widgets import Widget
from .workspaces import workspaces
from .clock import clock
from .pinned_apps import pinned_apps
from .tray import tray
from .battery import battery_widget


def bar(monitor: int) -> Widget.Window:
    return Widget.Window(
        anchor=["left", "top", "right"],
        exclusivity="exclusive",
        monitor=monitor,
        namespace=f"ignis_BAR_{monitor}",
        layer="top",
        child=Widget.CenterBox(
            css_classes=["bar-widget"],
            start_widget=Widget.Box(child=[workspaces()]),
            center_widget=Widget.Box(child=[pinned_apps()]),
            end_widget=Widget.Box(child=[tray(), battery_widget(), clock(monitor)]),
        ),
        css_classes=["unset"],
    )
