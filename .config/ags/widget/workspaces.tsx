import { bind, execAsync, Gtk, Gdk, Variable } from "astal";
import Hyprland from "gi://AstalHyprland";
import { activeWorkspaceIcon, workspacesIcons } from "./icons";

const dispatch = (arg: string | number) => execAsync(`hyprctl dispatch workspace ${arg}`);
const moveSilently = (arg: string | number) => execAsync(`hyprctl dispatch movetoworkspacesilent ${arg}`);

const ws = (id: number) => {
    const hyprland = Hyprland.get_default();
    const get = () => hyprland.get_workspace(id) || Hyprland.Workspace.dummy(id, null);

    return Variable(get()).observe(hyprland, "workspace-added", get).observe(hyprland, "workspace-removed", get);
};

const Button = (id: number) => {
    const hyprland = Hyprland.get_default();
    return bind(ws(id)).as((ws) => {
        const className = Variable.derive(
            [bind(hyprland, "focusedWorkspace"), bind(ws, "clients")],
            (focused, clients) => `
                ${focused === ws ? "focused" : ""}
                ${clients.length > 0 ? "occupied" : "empty"}
                workspacebutton
            `,
        );
        const isVisible = Variable.derive(
            [bind(hyprland, "focusedWorkspace"), bind(ws, "clients")],
            (focused, clients) => id <= 4 || clients.length > 0 || focused === ws,
        );
        const label = Variable.derive([bind(hyprland, "focusedWorkspace")], (focused) => {
            const idStr = id.toString();
            const label = idStr in workspacesIcons ? workspacesIcons[idStr as keyof typeof workspacesIcons] : idStr;
            if (focused === ws) {
                return activeWorkspaceIcon;
            }
            return label;
        });

        return (
            <button
                className={className()}
                visible={isVisible()}
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
    });
};

export const Workspaces = () => {
    const workspaceButtons = [...Array(10).keys()].map((id) => Button(id + 1));

    return (
        <box className="workspaces" halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER}>
            {workspaceButtons}
        </box>
    );
};

export default Workspaces;
