{ config, lib, pkgs, ... }:
with lib; {
  home-manager.users."${config.main-user}" = {
    programs.brew.mas = [ ''Vimari", id: 1480933944'' ];
    home.file.vimariPreferences = {
      text = ''
        {
          "excludedUrls": "",
          "linkHintCharacters": "aoeuihtns",
          "detectByCursorStyle": false,
          "scrollSize": 150,
          "openTabUrl": "https://google.co.uk/",
          "modifier": "",
          "smoothScroll": false,
          "scrollDuration": 25,
          "transparentBindings": true,
          "bindings": {
              "hintToggle": "a",
              "newTabHintToggle": "shift+f",
              "scrollUp": "t",
              "scrollDown": "h",
              "scrollLeft": "d",
              "scrollRight": "n",
              "scrollUpHalfPage": "g",
              "scrollDownHalfPage": "e",
              "goToPageTop": "i i",
              "goToPageBottom": "shift+i",
              "goToFirstInput": "i c",
              "goBack": "shift+d",
              "goForward": "shift+n",
              "reload": "p",
              "tabForward": ",",
              "tabBack": ";",
              "closeTab": "q",
              "openTab": "y"
          }
        }
      '';
      target =
        "Library/Containers/net.televator.Vimari.SafariExtension/Data/Library/Application Support/userSettings.json.symlink";
      onChange = ''
        #!${pkgs.stdenv.shell}
              cp $(/usr/bin/readlink ~/Library/Containers/net.televator.Vimari.SafariExtension/Data/Library/Application\ Support/userSettings.json.symlink) ~/Library/Containers/net.televator.Vimari.SafariExtension/Data/Library/Application\ Support/userSettings.json
      '';
    };
  };
}
