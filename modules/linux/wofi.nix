{pkgs, ...}: {
  home.packages = [
    pkgs.wofi
  ];
  # Create a wofi configuration file
  home.file = {
    ".config/wofi/config" = {
      text = ''
        lines=10
        prompt=Search..
      '';
    };

    ".config/wofi/style.css" = {
      text = ''
        window {
        margin: 0px;
        border: 1px solid #bd93f9;
        background-color: #282a36;
        }

        #input {
        margin: 5px;
        border: none;
        color: #f8f8f2;
        background-color: #44475a;
        }

        #inner-box {
        margin: 5px;
        border: none;
        background-color: #282a36;
        }

        #outer-box {
        margin: 5px;
        border: none;
        background-color: #282a36;
        }

        #scroll {
        margin: 0px;
        border: none;
        }

        #text {
        margin: 5px;
        border: none;
        color: #f8f8f2;
        }

        #entry.activatable #text {
        color: #282a36;
        }

        #entry > * {
        color: #f8f8f2;
        }

        #entry:selected {
        background-color: #44475a;
        }

        #entry:selected #text {
        font-weight: bold;
        }

      '';
    };
  };
}
