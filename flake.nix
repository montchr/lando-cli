{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  outputs = inp:
    (inp.dream2nix.lib.makeFlakeOutputs {
      systems = ["x86_64-linux"];
      config.projectRoot = ./.;
      source = ./.;
    }) // {
      overlays.default = final: prev: {lando-cli = inp.self.packages.${prev.system}."@lando/cli";};
};
}
