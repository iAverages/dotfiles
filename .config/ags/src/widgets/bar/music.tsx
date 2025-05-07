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
        ps[0] ? (
          <box>
            <label
              label={bind(ps[0], "title").as(
                () => `${ps[0].artist} - ${ps[0].title}`,
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
