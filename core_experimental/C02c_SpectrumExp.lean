import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Tactic

open Real

namespace PoincareSpectral.Experimental.C02c

noncomputable def r : ℝ := 0.125
noncomputable def C_exp : ℝ := Real.exp (r ^ 2)
noncomputable def q : ℝ := r ^ 3

lemma r_nonneg : 0 ≤ r := by norm_num [r]
lemma r_lt_half : r < 1/2 := by norm_num [r]
lemma r_sq_lt_quarter : r ^ 2 < 1/4 := by norm_num [r]

lemma C_exp_pos : 0 < C_exp := Real.exp_pos _
lemma C_exp_nonneg : 0 ≤ C_exp := le_of_lt C_exp_pos

lemma C_exp_lt_three_halves : C_exp < 3/2 := by
  unfold C_exp
  calc Real.exp (r ^ 2)
      < Real.exp (1/4 : ℝ) := Real.exp_lt_exp.mpr r_sq_lt_quarter
    _ < 3/2 := by
        have h_neg : (3:ℝ)/4 ≤ Real.exp (-1/4) := by
          have h := Real.add_one_le_exp (-1/4 : ℝ); linarith
        have hmul : Real.exp (1/4) * Real.exp (-1/4) = 1 := by
          rw [← Real.exp_add]; norm_num
        have hpos : (0:ℝ) < Real.exp (1/4) := Real.exp_pos _
        have hle : Real.exp (1/4) ≤ 4/3 := by
          nlinarith [mul_le_mul_of_nonneg_left h_neg hpos.le]
        linarith

lemma q_nonneg : 0 ≤ q := by unfold q r; positivity
lemma q_lt_one : q < 1 := by unfold q r; norm_num
lemma q_le_eighth : q ≤ 1/8 := by unfold q r; norm_num

theorem exp_bounds : C_exp < 3/2 ∧ q ≤ 1/8 :=
  ⟨C_exp_lt_three_halves, q_le_eighth⟩

end PoincareSpectral.Experimental.C02c
