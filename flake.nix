{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  outputs = inp@{self,dream2nix,...}:
    (dream2nix.lib.makeFlakeOutputs {
      systems = ["x86_64-linux"];
      config.projectRoot = ./.;
      source = ./.;
      settings = [
{
            subsystemInfo.noDev = true;
}
];
    }) // {
      overlays.default = final: prev: {lando-cli = self.packages.${prev.system}."@lando/cli";};
checks = self.packages;
};
}
