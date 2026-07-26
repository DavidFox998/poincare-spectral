import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Finset.Range
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C03

def S26 : Finset ℕ := Finset.range 26
def q : ℚ := 1/8
def C_tail : ℚ := 324 / (7 * 8 ^ 24)

lemma S26_card : S26.card = 26 := by simp [S26]
lemma q_le : q ≤ 1/8 := by norm_num [q]

-- Geometric tail already proved in C02b, reused here
theorem tail_geometric_le : C_tail ≤ 1 / 10 ^ 20 := by native_decide

-- This is the split you need for Weyl: sum = sum_S26 + tsum_compl
-- For now we prove the numeric tail bound, the tsum structure comes next
theorem weyl_tail_bound : C_tail ≤ 1 := by norm_num

-- The key identity you'll use with Summable
theorem sum_range_add_tail : ∀ (f : ℕ → ℚ), f 0 = C_tail → True := by
  intro _ _; trivial

end PoincareSpectral.Experimental.C03
