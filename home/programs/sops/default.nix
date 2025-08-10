{ config, inputs, ... }:
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "anthropic-api-key" = { };
    };
  };

  home.sessionVariables = {
    ANTHROPIC_API_KEY = "$(cat ${config.sops.secrets.anthropic-api-key.path})";
  };
}
