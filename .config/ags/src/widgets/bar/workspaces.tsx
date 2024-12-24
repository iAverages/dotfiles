import { bind, execAsync, Gtk, Gdk, Variable } from "astal";
import Hyprland from "gi://AstalHyprland";
import { activeWorkspaceIcon, workspacesIcons } from "../../utils/icons";

const dispatch = (arg: string | number) => execAsync(`hyprctl dispatch workspace ${arg}`);
const moveSilently = (arg: string | number) => execAsync(`hyprctl dispatch movetoworkspacesilent ${arg}`);

const Button = ({ ws }: { ws: Hyprland.Workspace }) => {
    const id = ws.get_id();
    const hyprland = Hyprland.get_default();
    const className = Variable.derive(
        [bind(hyprland, "focusedWorkspace"), bind(ws, "clients")],
        (focused, clients) => `
                ${focused === ws ? "focused" : ""}
                ${clients.length > 0 ? "occupied" : "empty"}
                workspacebutton
            `,
    );

    const label = Variable.derive([bind(hyprland, "focusedWorkspace")], (focused) => {
        const idStr = ws.get_id().toString();
        const label = idStr in workspacesIcons ? workspacesIcons[idStr as keyof typeof workspacesIcons] : idStr;
        if (focused === ws) {
            return activeWorkspaceIcon;
        }
        return label;
    });

    return (
        <button
            className={className()}
            valign={Gtk.Align.CENTER}
            halign={Gtk.Align.CENTER}
            cursor="pointer"
            onClick={(_, event) => {
                if (event.button === Gdk.BUTTON_PRIMARY) {
                    dispatch(id);
                }
                if (event.button === Gdk.BUTTON_SECONDARY) {
                    moveSilently(id);
                }
            }}
        >
            <box halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER}>
                <label label={label()} halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} />
            </box>
        </button>
    );
};

export const Workspaces = () => {
    const hypr = Hyprland.get_default();

    return (
        <box className="workspaces" halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER}>
            {bind(hypr, "workspaces").as((wss) =>
                wss
                    .filter((ws) => !(ws.id >= -99 && ws.id <= -2)) // filter out special workspaces
                    .sort((a, b) => a.id - b.id)
                    .map((ws) => <Button ws={ws} />),
            )}
        </box>
    );
};

export default Workspaces;
