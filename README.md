# Get Started
Required: Nix package manager

If you use direnv, you can just run `direnv allow` in the folder once to auto load the shell on entry.

Otherwise run 'nix develop' in the folder to get a shell with R/RStudio.

From there:

run `rstudio` to launch the RStudio GUI

run `R` to enter the R repl

run `Rscript example.R` to execute R scripts from the command line, or `Rscript --help` to see more options.

# Add R packages
Should be as simple as editing the flake.nix rpackages block.
Search the package name in any nixpkgs search tool or via the command line.
Run `direnv reload` or `nix develop`

# Update R
run `nix flake update` and reload the shell

# Learn R
The shell installs [swirl](https://swirlstats.com/), run it in either shell with:

```r
library("swirl")
swirl()
```
