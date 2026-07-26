import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C04

noncomputable def q : ℝ := 1/8

lemma q_nonneg : 0 ≤ q := by norm_num [q]
lemma q_lt_one : q < 1 := by norm_num [q]

lemma summable_q : Summable (fun n : ℕ => q ^ n) :=
  summable_geometric_of_lt_one q_nonneg q_lt_one

-- Tail as closed form q^26/(1-q) = 1/(7*8^25)
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹

-- (1/8)^26 * (8/7) = 1/(7*8^25) ≈ 3.8e-24 ≤ 1e-20
theorem weyl_tail_le_1e20 : tail_26 ≤ 1 / 10 ^ 20 := by
  unfold tail_26 q
  norm_num

theorem weyl_tail_le_one : tail_26 ≤ 1 := by
  unfold tail_26 q
  norm_num

-- Summable tail for later use with tsum
lemma summable_tail : Summable (fun n : ℕ => q ^ (n + 26)) := by
  have h : (fun n : ℕ => q ^ (n + 26)) = (fun n => q ^ n * q ^ 26) := by
    ext n; rw [pow_add]
  rw [h]
  exact (summable_q.mul_right (q ^ 26))

end PoincareSpectral.Experimental.C04
