{ config, lib, pkgs, ... }:
with lib; {
  options.alex.music.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Whether to install music helpers";
  };
  config = mkIf config.alex.music.enable {
    home.packages = with pkgs; [
      (writeScriptBin "youtube-dl_wav" ''
        ${pkgs.youtube-dl}/bin/youtube-dl --ffmpeg-location=${pkgs.ffmpeg}/bin/ffmpeg -x --audio-format=wav $1
      '')
      (writeScriptBin "download_wallpaper" ''
        ${pkgs.curl}/bin/curl -l $1 -o ~/Pictures/papes/$(${pkgs.coreutils}/bin/basename $1)
      '')
    ];
  };
}