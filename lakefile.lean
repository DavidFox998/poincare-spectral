import Lake
open Lake DSL

package poincareSpectral where
  version := v!"0.1.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

@[default_target]
lean_lib PoincareSpectral where
  srcDir := "."

lean_exe poincareSpectral where
  root := `Main
