{
  description = "A basic ros flake to spawn a ros enabled shell";
  inputs.nixpkgs.url = "github:beezow/nixpkgs/betaflight";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        nativeBuildInputs = [

 	];
        buildInputs = [
          pkgs.gcc-arm-embedded-9
          pkgs.newlib
          pkgs.betaflight-configurator
        ];
        #setup nvidia offload
        __VK_LAYER_NV_optimus = "NVIDIA_only";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
	__NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
	__NV_PRIME_RENDER_OFFLOAD = 1;
      };
    });
}
