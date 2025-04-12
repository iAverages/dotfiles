import { bind } from "astal";
import Apps from "gi://AstalApps";
import Hyprland from "gi://AstalHyprland";
const hyprland = Hyprland.get_default();

const apps = new Apps.Apps({
  entryMultiplier: 2,
  executableMultiplier: 2,
});

const AppItem = ({ client }: { client: Hyprland.Client }) => {
  const app = apps.fuzzy_query(client.initialClass)[0];
  return app ? (
    // TODO: Focus app on client
    <button className={"app"} cursor={"pointer"}>
      <icon icon={app.iconName} />
    </button>
  ) : null;
};

// TODO: make app items use full height
// TODO: only show apps for the current monitor

export const Taskbar = () => {
  return (
    <box className={"taskbar"}>
      {bind(hyprland, "clients").as((clients) =>
        clients.map((client) => {
          return <AppItem client={client} />;
        }),
      )}
    </box>
  );
};
