import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C02b

def r : ℚ := 1/8
def C_exp : ℚ := 1
def q : ℚ := 1/8

lemma r_nonneg : 0 ≤ r := by norm_num [r]
lemma r_lt_half : r < 1/2 := by norm_num [r]
lemma C_exp_lt_three_halves : C_exp < 3/2 := by norm_num [C_exp]

lemma q_nonneg : 0 ≤ q := by norm_num [q]
lemma q_le_eighth : q ≤ 1/8 := by norm_num [q]

theorem tail_numeric_bound : (324 : ℚ) / (7 * 8 ^ 24) ≤ 1 := by
  norm_num

theorem tail_numeric_bound_1e20 : (324 : ℚ) / (7 * 8 ^ 24) ≤ 1 / 10 ^ 20 := by
  -- native_decide runs in VM, handles 8^24 = 2^72
  native_decide

theorem tail_bound_S3 : (6 : ℚ) * C_exp ^ 3 * q ^ 24 / (1 - q) * 2 ≤ 1 := by
  unfold C_exp q
  norm_num

end PoincareSpectral.Experimental.C02b
