import Lake
open Lake DSL

package poincare_spectral where
  version := v!"0.1.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

@[default_target]
lean_lib core where
  srcDir := "."
  globs := #[.submodules `core]

@[default_target]
lean_lib Towers where
  srcDir := "."
  globs := #[.submodules `Towers]

@[default_target]
lean_lib core_experimental where
  srcDir := "."
  globs := #[.submodules `core_experimental]
