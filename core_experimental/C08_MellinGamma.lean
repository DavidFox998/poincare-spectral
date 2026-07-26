import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C08

noncomputable def q : ℝ := 1/8
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹
noncomputable def conductor_gap : ℝ := 1 - tail_26

noncomputable def mellinBessel (ν s : ℝ) : ℝ :=
  (2 : ℝ) ^ (s - 2) * Real.Gamma ((s + ν)/2) * Real.Gamma ((s - ν)/2)

noncomputable def zetaMellinFactor (s : ℝ) : ℝ :=
  Real.Gamma s⁻¹ * mellinBessel 0 s

lemma gamma_add_one_ne {s : ℝ} (hs : s ≠ 0) :
  Real.Gamma (s+1) = s * Real.Gamma s :=
  Real.Gamma_add_one hs

lemma mellinBessel0_3_eq :
  mellinBessel 0 3 = 2 * (Real.Gamma 1.5 * Real.Gamma 1.5) := by
  unfold mellinBessel
  norm_num

lemma tail_le_1e20 : tail_26 ≤ 1/10^20 := by
  unfold tail_26 q; norm_num

lemma gap_pos : 0 < conductor_gap := by
  unfold conductor_gap tail_26 q; norm_num

lemma mellin_pos {ν s : ℝ} (h1 : 0 < (s+ν)/2) (h2 : 0 < (s-ν)/2) :
  0 < mellinBessel ν s := by
  unfold mellinBessel
  have hpow : 0 < (2:ℝ) ^ (s-2) := Real.rpow_pos_of_pos (by norm_num) _
  exact mul_pos (mul_pos hpow (Real.Gamma_pos_of_pos h1)) (Real.Gamma_pos_of_pos h2)

theorem mellin_gamma_main :
  0 < mellinBessel 0 3 ∧ 0 < conductor_gap ∧ tail_26 ≤ 1/10^20 ∧ 0 < Real.Gamma 1.5 := by
  refine ⟨?_, gap_pos, tail_le_1e20, Real.Gamma_pos_of_pos (by norm_num)⟩
  exact mellin_pos (by norm_num) (by norm_num)

end PoincareSpectral.Experimental.C08
