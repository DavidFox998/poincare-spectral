import Lake
open Lake DSL

package poincare_spectral where
  version := v!"0.1.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

@[default_target]
lean_lib Towers where
  srcDir := "Towers"

@[default_target]
lean_lib Spectral where
  srcDir := "Spectral"

lean_exe main where
  root := `Main
