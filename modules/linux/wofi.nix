{pkgs, ...}: {
  home.packages = [
    pkgs.wofi
  ];
  # Create a wofi configuration file
  home.file = {
    ".config/wofi/config" = {
      text = ''
        lines=6
        prompt=Search..
      '';
    };

    ".config/wofi/style.css" = {
      text = ''
        window {
        margin: 0px;
        background-color: #1F1F1F;
        border-radius: 8px;
        }

        #input {
        margin: 5px;
        border: none;
        color: #d9e0ee;
        background-color:rgb(61, 61, 61);
        }

        #inner-box {
        margin: 5px;
        border: none;
        background-color: #1F1F1F;
        }

        #outer-box {
        margin: 5px;
        border: none;
        background-color: #1F1F1F;
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
        color: #1F1F1F;
        }

        #entry > * {
        color: #f8f8f2;
        }

        #entry:selected {
        background-color: rgb(61, 61, 61);;
        }

        #entry:selected #text {
        font-weight: bold;
        font-size: 14px;
        }

      '';
    };
  };
}
