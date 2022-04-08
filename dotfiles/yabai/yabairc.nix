{ config, lib, pkgs, ... }:
let
  brewBinPath = "/opt/homebrew/bin";
  yabai = "${brewBinPath}/yabai";
in
{
  executable = true;
  text = ''
    sudo ${yabai} --load-sa
    ${yabai} -m signal --add event=dock_did_restart action="sudo ${yabai} --load-sa"

    ${yabai} -m config layout bsp

    ${yabai} -m config top_padding 20
    ${yabai} -m config bottom_padding 20
    ${yabai} -m config left_padding 20
    ${yabai} -m config right_padding 20
    ${yabai} -m config window_gap 20

    ${yabai} -m config window_topmost on

    ${yabai} -m config window_opacity_on
    ${yabai} -m config active_window_opacity 1.0
    ${yabai} -m config normal_window_opacity 0.5
  '';
}
