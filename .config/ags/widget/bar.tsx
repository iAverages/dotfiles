import { App, Astal, Gtk, Gdk } from "astal";
import Workspaces from "./workspaces";
import { Taskbar } from "./apps-tiler";
import { DateTime } from "./date-time";

const LeftBar = () => {
    return (
        <box className="left" halign={Gtk.Align.START} valign={Gtk.Align.START} spacing={5}>
            <Workspaces />
            <Taskbar />
        </box>
    );
};

const CenterBar = () => {
    return (
        <box className={"center"} spacing={10} halign={Gtk.Align.CENTER} valign={Gtk.Align.START}>
            {/* <MediaPlayer /> */}
        </box>
    );
};

const RightBar = () => {
    return (
        <box className={"right"} halign={Gtk.Align.END} valign={Gtk.Align.START} spacing={5}>
            <DateTime />
        </box>
    );
};

export default function Bar(monitor: Gdk.Monitor) {
    return (
        <window
            className={"bar"}
            gdkmonitor={monitor}
            application={App}
            anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
        >
            <centerbox>
                <LeftBar />
                <CenterBar />
                <RightBar />
            </centerbox>
        </window>
    );
}
