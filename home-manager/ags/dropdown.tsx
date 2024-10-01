import { App, Astal, Gtk, Widget } from "astal";

export type DropdownMenuProps = {
  name: string;
  children?: JSX.Element[];
};

export const DropdownMenu = ({ name, children }: DropdownMenuProps) => {
  return (
    <window
      name={name}
      className={"dropdown-menu"}
      onKeyPressEvent={() => App.toggle_window(name)}
      keymode={Astal.Keymode.ON_DEMAND}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      layer={Astal.Layer.TOP}
    >
      <eventbox
        onClick={() => {
          App.toggle_window(name);
        }}
      >
        {children}
      </eventbox>
    </window>
  );
};
