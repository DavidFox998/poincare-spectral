import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Tactic

set_option sorry false

namespace PoincareSpectral.Experimental.C15

open MeasureTheory Set Real

noncomputable def q : ℝ := 1/8
noncomputable def conductor_gap : ℝ := 1 - q ^ 26 * (1 - q)⁻¹

noncomputable def besselK_toy (r : ℝ) : ℝ := Real.exp (-r)

noncomputable def mellinIntegralReal (s : ℝ) : ℝ :=
  ∫ r in Ioi (0:ℝ), r ^ (s - 1) * besselK_toy r

-- This is the lemma that will give us the real RED
-- with the correct Gamma name in 4.12.0
lemma integrable_toy (s : ℝ) (hs : 0 < s) :
  IntegrableOn (fun r => r ^ (s - 1) * Real.exp (-r)) (Ioi 0) := by
  sorry

end PoincareSpectral.Experimental.C15
