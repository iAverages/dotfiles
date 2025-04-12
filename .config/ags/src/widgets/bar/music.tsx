import { bind } from "astal";
import { Gtk } from "astal/gtk3";
import Mpris from "gi://AstalMpris";

export const Music = () => {
  const mpris = Mpris.get_default();

  return (
    <box
      className="music"
      spacing={4}
      valign={Gtk.Align.CENTER}
      halign={Gtk.Align.START}
    >
      {bind(mpris, "players").as((ps) =>
        ps[1] ? (
          <box>
            <label
              label={bind(ps[1], "title").as(
                () => `${ps[1].artist} - ${ps[1].title}`,
              )}
            />
          </box>
        ) : (
          "Nothing Playing"
        ),
      )}
    </box>
  );
};
