import { App, Astal, Gtk, Gdk, bind } from "astal";
import { Music } from "./music";
import Workspaces from "./workspaces";
import { Taskbar } from "./apps-tiler";
import { DateTime } from "./date-time";

import Battery from "gi://AstalBattery";
import Wp from "gi://AstalWp";
import Network from "gi://AstalNetwork";
import Tray from "gi://AstalTray";

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
        <box className={"center"} spacing={10} halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER}>
            <Music />
        </box>
    );
};

const RightBar = () => {
    return (
        <box className={"right right-bg"} halign={Gtk.Align.END} valign={Gtk.Align.CENTER}>
            <SysTray />
            <BatteryLevel />
            <Wifi />
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

function SysTray() {
    const tray = Tray.get_default();

    return (
        <box className="SysTray">
            {bind(tray, "items").as((items) =>
                items.map((item) => (
                    <menubutton
                        tooltipMarkup={bind(item, "tooltipMarkup")}
                        usePopover={false}
                        actionGroup={bind(item, "action-group").as((ag) => ["dbusmenu", ag])}
                        menuModel={bind(item, "menu-model")}
                    >
                        <icon gicon={bind(item, "gicon")} />
                    </menubutton>
                )),
            )}
        </box>
    );
}

function Wifi() {
    const { wifi } = Network.get_default();

    return <icon tooltipText={bind(wifi, "ssid").as(String)} className="Wifi" icon={bind(wifi, "iconName")} />;
}

function AudioSlider() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!;

    return (
        <box className="AudioSlider" css="min-width: 140px">
            <icon icon={bind(speaker, "volumeIcon")} />
            <slider hexpand onDragged={({ value }) => (speaker.volume = value)} value={bind(speaker, "volume")} />
        </box>
    );
}

function BatteryLevel() {
    const bat = Battery.get_default();

    return (
        <box className="Battery" visible={bind(bat, "isPresent")}>
            <icon icon={bind(bat, "batteryIconName")} />
            <label label={bind(bat, "percentage").as((p) => `${Math.floor(p * 100)} %`)} />
        </box>
    );
}
