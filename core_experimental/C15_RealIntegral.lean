set_option sorry false

import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral

-- now this WILL be red
lemma integrable_toy (s : ℝ) (hs : 0 < s) :
  IntegrableOn (fun r => r ^ (s-1) * Real.exp (-r)) (Ioi 0) := by
  -- Lean will try to find Real.Gamma_integral in 4.12.0
  -- and fail here with the real error we need
  apply Real.GammaIntegral_convergent
  sorry
