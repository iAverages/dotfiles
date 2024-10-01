import Gdk from "gi://Gdk?version=3.0";
import Gtk from "gi://Gtk?version=3.0";

export function forMonitors(widget: (monitor: number) => Gtk.Widget) {
  const monitors = Gdk.Display.get_default()?.get_n_monitors() || 1;
  return Array.from({ length: monitors }, (_, i) => i).flatMap(widget);
}
