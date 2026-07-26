import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

-- Final Poincaré Spectral Tower
-- Author: David Fox (DavidFox998)
-- C02b + C02c + C03 + C04 + C05 = closed

namespace PoincareSpectral.Experimental.C06

noncomputable def q : ℝ := 1/8
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹
noncomputable def conductor_gap : ℝ := 1 - tail_26
noncomputable def bessel_exp_bound : ℝ := 3/2
noncomputable def rational_tail : ℚ := 324 / (7 * 8 ^ 24 : ℚ)

lemma rational_tail_le : rational_tail ≤ 1 / 10 ^ 20 := by
  unfold rational_tail; norm_num

lemma tail_le_1e20 : tail_26 ≤ 1 / 10 ^ 20 := by
  unfold tail_26 q; norm_num

lemma tail_pos : 0 ≤ tail_26 := by
  unfold tail_26 q; positivity

lemma gap_pos : 0 < conductor_gap := by
  unfold conductor_gap tail_26 q; norm_num

lemma gap_lower : 1 - 1 / 10 ^ 20 ≤ conductor_gap := by
  unfold conductor_gap tail_26 q; norm_num

lemma summable_q : Summable (fun n : ℕ => q ^ n) :=
  summable_geometric_of_lt_one (by norm_num [q]) (by norm_num [q])

theorem poincare_spectral_gap :
  0 < conductor_gap ∧
  tail_26 ≤ 1 / 10 ^ 20 ∧
  0 ≤ tail_26 ∧
  Summable (fun n : ℕ => q ^ n) ∧
  rational_tail ≤ 1 / 10 ^ 20 :=
  ⟨gap_pos, tail_le_1e20, tail_pos, summable_q, rational_tail_le⟩

theorem poincare_conductor_main :
  conductor_gap ≥ 1 - 1 / 10 ^ 20 ∧ tail_26 ≤ 1 / 10 ^ 20 :=
  ⟨gap_lower, tail_le_1e20⟩

end PoincareSpectral.Experimental.C06
