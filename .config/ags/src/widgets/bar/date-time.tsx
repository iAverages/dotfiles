import { GLib, Gtk, Variable } from "astal";

const dateFormat = "%d/%m/%Y";
const timeFormat = "%H:%M";

export const DateTime = () => {
    const time = Variable<string>("").poll(1000, () => GLib.DateTime.new_now_local().format(timeFormat)!);
    const date = Variable<string>("").poll(1000, () => GLib.DateTime.new_now_local().format(dateFormat)!);

    return (
        <box className={"date-time"} halign={Gtk.Align.CENTER} vertical valign={Gtk.Align.CENTER}>
            <label onDestroy={() => time.drop()} label={time()} />
            <label onDestroy={() => date.drop()} label={date()} />
        </box>
    );
};
