/-
C02b - FINAL GREEN - decimal only, no inv notation
-/
import Mathlib.Data.Real.Basic

namespace PoincareSpectral.Experimental.C02b

noncomputable def r : ℝ := 0.125
noncomputable def C_exp : ℝ := 1
noncomputable def q : ℝ := 0.125

lemma r_nonneg : 0 ≤ r := by norm_num [r]
lemma r_lt_half : r < 0.5 := by norm_num [r]
lemma C_exp_lt_three_halves : C_exp < 1.5 := by norm_num [C_exp]

lemma q_nonneg : 0 ≤ q := by norm_num [q]
lemma q_le_eighth : q ≤ 0.125 := by norm_num [q]

theorem tail_numeric_bound : (324 : ℝ) / (7 * 8 ^ 24) ≤ 1 := by norm_num
theorem tail_numeric_bound_1e20 : (324 : ℝ) / (7 * 8 ^ 24) ≤ 1 / 10 ^ 20 := by norm_num

theorem tail_bound_S3 : (6 : ℝ) * C_exp ^ 3 * q ^ 24 / (1 - q) * 2 ≤ 1 := by
  unfold C_exp q
  norm_num

end PoincareSpectral.Experimental.C02b
