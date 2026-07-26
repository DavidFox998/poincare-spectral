import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C08

noncomputable def q : ℝ := 1/8
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹
noncomputable def conductor_gap : ℝ := 1 - tail_26

noncomputable def mellinBessel (ν s : ℝ) : ℝ :=
  (2 : ℝ) ^ (s - 2) * Real.Gamma ((s + ν)/2) * Real.Gamma ((s - ν)/2)

lemma tail_le_1e20 : tail_26 ≤ 1/10^20 := by
  unfold tail_26 q; norm_num

lemma gap_pos : 0 < conductor_gap := by
  unfold conductor_gap tail_26 q; norm_num

lemma mellin_pos : 0 < mellinBessel 0 3 := by
  unfold mellinBessel
  have h1 : (0:ℝ) < (3 + 0)/2 := by norm_num
  have h2 : (0:ℝ) < (3 - 0)/2 := by norm_num
  have hp : (0:ℝ) < (2:ℝ) ^ ((3:ℝ)-2) := Real.rpow_pos_of_pos (by norm_num) _
  exact mul_pos (mul_pos hp (Real.Gamma_pos_of_pos h1)) (Real.Gamma_pos_of_pos h2)

theorem mellin_gamma_main :
  0 < mellinBessel 0 3 ∧ 0 < conductor_gap ∧ tail_26 ≤ 1/10^20 :=
  ⟨mellin_pos, gap_pos, tail_le_1e20⟩

end PoincareSpectral.Experimental.C08
