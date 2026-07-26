import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic.NormNum

namespace PoincareSpectral.Experimental.C02b

def r : ℚ := 0.125
def C_exp : ℚ := 1
def q : ℚ := 0.125

lemma r_nonneg : 0 ≤ r := by decide
lemma r_lt_half : r < 0.5 := by decide
lemma C_exp_lt_three_halves : C_exp < 1.5 := by decide

lemma q_nonneg : 0 ≤ q := by decide
lemma q_le_eighth : q ≤ 0.125 := by decide

theorem tail_numeric_bound : (324 : ℚ) / (7 * 8 ^ 24) ≤ 1 := by decide
theorem tail_numeric_bound_1e20 : (324 : ℚ) / (7 * 8 ^ 24) ≤ 1 / 10 ^ 20 := by decide

theorem tail_bound_S3 : (6 : ℚ) * C_exp ^ 3 * q ^ 24 / (1 - q) * 2 ≤ 1 := by
  unfold C_exp q
  decide

end PoincareSpectral.Experimental.C02b
