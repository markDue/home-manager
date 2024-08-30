{
  description = "Home Manager configuration of marc";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = { nixpkgs, home-manager, nixgl, ... }:
    let
      system = "x86_64-linux";
      #pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      overlays = [ nixgl.overlay ];
      };
    in {
      homeConfigurations."marc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
        #nixpkgs.overlays = [ ( final: prev: { dwl = prev.dwl.overrideAttrs { patches = [ ./dwl-patches/focusdirection.patch ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        #      pkgs.nixgl.nixGLIntel
      };

    };
}
