import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Tactic

open scoped Topology

namespace PoincareSpectral.Experimental.C04

noncomputable def q : ℝ := 1/8

lemma q_nonneg : 0 ≤ q := by norm_num [q]
lemma q_lt_one : q < 1 := by norm_num [q]
lemma q_pos : 0 < q := by norm_num [q]

-- Geometric summable from mathlib
lemma summable_q : Summable (fun n : ℕ => q ^ n) :=
  summable_geometric_of_lt_one q_nonneg q_lt_one

lemma tsum_q_eq : ∑' n : ℕ, q ^ n = (1 - q)⁻¹ :=
  tsum_geometric_of_lt_one q_nonneg q_lt_one

-- Shifted tail n ≥ 26 = q^26 * ∑ q^n
noncomputable def tail_26 : ℝ := ∑' n : ℕ, q ^ (n + 26)

lemma summable_tail : Summable (fun n : ℕ => q ^ (n + 26)) := by
  have : (fun n : ℕ => q ^ (n + 26)) = (fun n => q ^ 26 * q ^ n) := by
    ext n; rw [pow_add]
  rw [this]
  exact summable_q.mul_left (q ^ 26)

lemma tail_eq : tail_26 = q ^ 26 * (1 - q)⁻¹ := by
  unfold tail_26
  have h1 : ∑' n : ℕ, q ^ 26 * q ^ n = q ^ 26 * ∑' n : ℕ, q ^ n :=
    tsum_mul_left
  have h2 : (fun n : ℕ => q ^ (n + 26)) = (fun n => q ^ 26 * q ^ n) := by
    ext n; rw [pow_add]
  calc ∑' n, q ^ (n + 26)
      = ∑' n, q ^ 26 * q ^ n := by rw [h2]
    _ = q ^ 26 * ∑' n, q ^ n := h1
    _ = q ^ 26 * (1 - q)⁻¹ := by rw [tsum_q_eq]

-- The key bound: (1/8)^26 / (7/8) = 8 / (7*8^26) = 1/(7*8^25) ≤ 1/10^20
-- (1/8)^26 = 1/2^78 ≈ 3.3e-24, so this is trivial
theorem weyl_tail_le_1e20 : tail_26 ≤ 1 / 10 ^ 20 := by
  rw [tail_eq]
  unfold q
  norm_num

-- Sum + tsum_compl identity placeholder for your S26 split
-- Once green, you use Finset.sum_add_tsum_compl S26 summable_q
theorem sum_add_tail_eq_tsum :
  (∑ n ∈ Finset.range 26, (1/8 : ℝ) ^ n) + tail_26 = (1 - q)⁻¹ := by
  have h_sum : ∑ n ∈ Finset.range 26, q ^ n + ∑' n, q ^ (n + 26) = ∑' n, q ^ n := by
    -- This is sum_add_tsum_compl for range 26, proved via induction on Summable
    have hsumm := summable_q
    -- Use the mathlib lemma: sum_range + tail = tsum
    have := hsumm.sum_add_tsum_compl 26
    simpa [tail_26] using this
  rw [h_sum, tsum_q_eq]

end PoincareSpectral.Experimental.C04
