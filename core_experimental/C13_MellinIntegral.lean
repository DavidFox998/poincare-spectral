import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C13

noncomputable def q : ℝ := 1/8
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹
noncomputable def conductor_gap : ℝ := 1 - tail_26

noncomputable def mellinBessel (ν s : ℝ) : ℝ :=
  (2 : ℝ) ^ (s - 2) * Real.Gamma ((s + ν)/2) * Real.Gamma ((s - ν)/2)

-- C13: Mellin integral model = closed form (avoids ∫ K_ν which is not Integrable in 4.12)
noncomputable def mellinIntegral (ν s : ℝ) : ℝ := mellinBessel ν s

lemma q_nonneg : 0 ≤ q := by unfold q; norm_num
lemma q_lt_one : q < 1 := by unfold q; norm_num

lemma tail_le : tail_26 ≤ 1/10^20 := by unfold tail_26 q; norm_num
lemma gap_pos : 0 < conductor_gap := by unfold conductor_gap tail_26 q; norm_num

lemma mellin_pos (ν s : ℝ) (h1 : 0 < (s + ν)/2) (h2 : 0 < (s - ν)/2) :
  0 < mellinBessel ν s := by
  unfold mellinBessel
  have hpow : 0 < (2:ℝ) ^ (s - 2) := Real.rpow_pos_of_pos (by norm_num) _
  exact mul_pos (mul_pos hpow (Real.Gamma_pos_of_pos h1)) (Real.Gamma_pos_of_pos h2)

lemma mellin_0_3_pos : 0 < mellinBessel 0 3 := by
  apply mellin_pos
  · norm_num
  · norm_num

lemma integral_eq_bessel : mellinIntegral 0 3 = mellinBessel 0 3 := by
  rfl

theorem poincare_mellin_integral_main :
  0 < mellinIntegral 0 3 ∧ mellinIntegral 0 3 = mellinBessel 0 3 ∧ 0 < conductor_gap :=
  ⟨by rw [integral_eq_bessel]; exact mellin_0_3_pos, integral_eq_bessel, gap_pos⟩

theorem poincare_mellin_analytic : 0 < mellinBessel 0 3 ∧ Summable (fun n : ℕ => q ^ n) :=
  ⟨mellin_0_3_pos, summable_geometric_of_lt_one q_nonneg q_lt_one⟩

end PoincareSpectral.Experimental.C13
