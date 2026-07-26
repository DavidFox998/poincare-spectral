import Lake
open Lake DSL

package poincareSpectral where
  version := v!"0.1.0"
  description := "poincare-spectral — S³ spectral rigidity — Theorema Aureum 143"
  -- Lean 4.12.0

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

@[default_target]
lean_lib Towers where
  srcDir := "Towers"
  globs := #[.glob "Conductor"]

@[default_target]
lean_lib Spectral where
  srcDir := "Spectral"
  globs := #[.glob "C01_S3", .glob "C02_Spectrum", .glob "C03_Weyl", .glob "C04_Rigidity", .glob "C05_Main"]

lean_exe poincareSpectral where
  root := `Main
