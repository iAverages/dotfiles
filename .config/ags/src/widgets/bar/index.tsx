import { bind } from "astal";
import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import { Music } from "./music";
import Workspaces from "./workspaces";
import { Taskbar } from "./apps-tiler";
import { DateTime } from "./date-time";

import Battery from "gi://AstalBattery";
import Wp from "gi://AstalWp";
import Network from "gi://AstalNetwork";
import Tray from "gi://AstalTray";
import FloatingWindow from "../floatingWindow";

const LeftBar = () => {
  return (
    <box
      className="left"
      halign={Gtk.Align.START}
      valign={Gtk.Align.CENTER}
      spacing={5}
    >
      <Workspaces />
      <Taskbar />
    </box>
  );
};

const CenterBar = () => {
  return (
    <box
      className={"center"}
      spacing={10}
      halign={Gtk.Align.CENTER}
      valign={Gtk.Align.CENTER}
    >
      <Music />
    </box>
  );
};

const RightBar = () => {
  return (
    <box
      className={"right right-bg"}
      halign={Gtk.Align.END}
      valign={Gtk.Align.CENTER}
      spacing={8}
    >
      <SysTray />
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
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
    >
      <centerbox className={"bar-inner"}>
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
    <box
      halign={Gtk.Align.CENTER}
      valign={Gtk.Align.CENTER}
      className="systray"
    >
      {bind(tray, "items").as((items) =>
        items.map((item, index) => (
          <menubutton
            tooltipMarkup={bind(item, "tooltipMarkup")}
            usePopover={false}
            actionGroup={bind(item, "action_group").as((ag) => [
              "dbusmenu",
              ag,
            ])}
            className={index === 0 ? "rounded-left" : ""}
            menuModel={bind(item, "menu_model")}
          >
            <icon gicon={bind(item, "gicon")} />
          </menubutton>
        )),
      )}

      <box css={"padding: 0px 8px 0px 0px;"}>
        <BatteryLevel />
        <Wifi />
      </box>
    </box>
  );
}

function Wifi() {
  const network = Network.get_default();

  return (
    <>
      {bind(network, "primary").as((primary) => {
        if (primary === Network.Primary.UNKNOWN) {
          return <icon icon="network-wireless-offline-symbolic" />;
        }

        if (primary === Network.Primary.WIRED) {
          const wiredNetwork = network.get_wired()!;

          return <icon icon={bind(wiredNetwork, "iconName")} />;
        }

        if (primary === Network.Primary.WIFI) {
          const wifiNetwork = network.get_wifi()!;

          return <icon icon={bind(wifiNetwork, "iconName")} />;
        }
      })}
    </>
  );
}

function AudioSlider() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  return (
    <box className="AudioSlider" css="min-width: 140px">
      <icon icon={bind(speaker, "volumeIcon")} />
      <slider
        hexpand
        onDragged={({ value }) => (speaker.volume = value)}
        value={bind(speaker, "volume")}
      />
    </box>
  );
}

function BatteryLevel() {
  const bat = Battery.get_default();

  return (
    <box className="Battery" visible={bind(bat, "isPresent")}>
      <icon icon={bind(bat, "batteryIconName")} />
      <label
        label={bind(bat, "percentage").as((p) => `${Math.floor(p * 100)} %`)}
      />
    </box>
  );
}
