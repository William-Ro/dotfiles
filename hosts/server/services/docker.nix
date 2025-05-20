{config, ...}: {
  virtualisation.docker = {
    enable = true;
    logDriver = "none";
  };

  users.users.${config.username}.extraGroups = ["docker"];
}
