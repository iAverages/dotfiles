import { GLib, Variable } from "astal";

export const Time = ({ format = "%H:%M - %A %e." }) => {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(format)!,
  );

  return (
    <label className="Time" onDestroy={() => time.drop()} label={time()} />
  );
};
