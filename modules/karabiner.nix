{
  pkgs,
  username,
  ...
}: {
  # ... tu configuración existente ...

  # Instalar Karabiner-Elements
  homebrew = {
    enable = true;
    casks = ["karabiner-elements"];
  };

  # Crear la configuración de Karabiner
  home.file.".config/karabiner/karabiner.json".text = builtins.toJSON {
    global = {
      check_for_updates_on_startup = true;
      show_in_menu_bar = true;
      show_profile_name_in_menu_bar = false;
    };
    profiles = [
      {
        name = "Default profile";
        selected = true;
        complex_modifications = {
          parameters = {
            "basic.simultaneous_threshold_milliseconds" = 50;
            "basic.to_delayed_action_delay_milliseconds" = 500;
            "basic.to_if_alone_timeout_milliseconds" = 1000;
            "basic.to_if_held_down_threshold_milliseconds" = 500;
          };
          rules = [
            {
              description = "Disable Command+H and Command+M";
              manipulators = [
                {
                  description = "Disable Command+H (Hide)";
                  from = {
                    key_code = "h";
                    modifiers = {
                      mandatory = ["command"];
                      optional = ["any"];
                    };
                  };
                  to = [
                    {
                      key_code = "vk_none";
                    }
                  ];
                  type = "basic";
                }
                {
                  description = "Disable Command+M (Minimize)";
                  from = {
                    key_code = "m";
                    modifiers = {
                      mandatory = ["command"];
                      optional = ["any"];
                    };
                  };
                  to = [
                    {
                      key_code = "vk_none";
                    }
                  ];
                  type = "basic";
                }
              ];
            }
          ];
        };
        devices = [];
        fn_function_keys = [];
        simple_modifications = [];
      }
    ];
  };
}
