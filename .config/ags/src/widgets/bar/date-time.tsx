import { GLib, Variable } from "astal";
import { Gtk } from "astal/gtk3";

const dateFormat = "%d/%m";
const timeFormat = "%H:%M";

export const DateTime = () => {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(timeFormat)!,
  );
  const date = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(dateFormat)!,
  );

  return (
    <box
      className={"date-time"}
      halign={Gtk.Align.CENTER}
      valign={Gtk.Align.FILL}
      spacing={6}
    >
      <label onDestroy={() => time.drop()} label={time()} />
      <label onDestroy={() => date.drop()} label={date()} />
    </box>
  );
};
