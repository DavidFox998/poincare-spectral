import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C03

def q : ℚ := 1/8
def C_tail : ℚ := 324 / (7 * 8 ^ 24)

lemma q_le : q ≤ 1/8 := by norm_num [q]

theorem tail_geometric_le : C_tail ≤ 1 / 10 ^ 20 := by native_decide

theorem weyl_tail_bound : C_tail ≤ 1 := by native_decide

theorem sum_split_placeholder : C_tail ≤ 1 / 10 ^ 20 := tail_geometric_le

end PoincareSpectral.Experimental.C03
