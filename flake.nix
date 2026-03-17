{
  description = "R and RStudio Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        rpkgs = with pkgs.rPackages; [
          swirl # Tool to learn R: https://swirlstats.com/
          # Packages can be found under 'rPackages.*'
          # e.g., rmarkdown, knitr, etc.
        ];

				# Link CLI/GUI with defined r packages
        r-wrapper = pkgs.rWrapper.override { packages = rpkgs; };
        r-studio-wrapper = pkgs.rstudioWrapper.override { packages = rpkgs; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            r-wrapper
            r-studio-wrapper
          ];

          shellHook = ''
						echo ""
          	echo "-----------------------------------------------"
          	echo "run \`rstudio\` to launch the RStudio GUI"
						echo ""
						echo "run \`R\` to enter the R repl"
						echo ""
          	echo "run \`Rscript example.R\` to execute R scripts from the command line, or \`Rscript --help\` to see more options."
          	echo "-----------------------------------------------"
						echo ""
          '';
        };
      }
    );
}
