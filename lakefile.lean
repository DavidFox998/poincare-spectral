import Lake
open Lake DSL

package poincare_spectral where
  version := v!"0.1.0"
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.15.0"

lean_lib PoincareSpectral where
  srcDir := "."
