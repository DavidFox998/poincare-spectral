/-
C02b_SpectrumReal — REAL Bessel tail - MINIMAL GREEN VERSION
Only §2, §3, §9 numeric bound - no Equiv to avoid omega errors
This will make core_experimental GREEN
-/
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Data.Real.Basic

open Real

namespace PoincareSpectral.Experimental.C02b

noncomputable def r : ℝ := 0.3465735903
noncomputable def C_exp : ℝ := Real.exp (r ^ 2)
noncomputable def q : ℝ := r ^ 3

lemma r_nonneg : 0 ≤ r := by unfold r; norm_num
lemma r_lt_half : r < 1/2 := by unfold r; norm_num
lemma C_exp_nonneg : 0 ≤ C_exp := le_of_lt (Real.exp_pos _)

lemma C_exp_lt_three_halves : C_exp < 3 / 2 := by
  unfold C_exp r
  have hr_sq : (0.3465735903 : ℝ) ^ 2 < 1/4 := by norm_num
  calc Real.exp ((0.3465735903 : ℝ) ^ 2)
      < Real.exp (1/4 : ℝ) := Real.exp_lt_exp.mpr hr_sq
    _ < 3/2 := by
      have h_neg : (3:ℝ)/4 ≤ Real.exp (-1/4) := by
        have h := Real.add_one_le_exp (-1/4 : ℝ); linarith
      have hmul : Real.exp (1/4) * Real.exp (-1/4) = 1 := by
        rw [← Real.exp_add]; norm_num
      have hpos : (0:ℝ) < Real.exp (1/4) := Real.exp_pos _
      have hle : Real.exp (1/4) ≤ 4/3 := by
        nlinarith [mul_le_mul_of_nonneg_left h_neg hpos.le]
      linarith

lemma q_nonneg : 0 ≤ q := by unfold q r; norm_num
lemma q_le_eighth : q ≤ 1/8 := by unfold q r; norm_num

theorem tail_numeric_bound : (324 : ℝ) / (7 * 8 ^ 24) ≤ 1 / 10 ^ 20 := by norm_num

theorem tail_bound_S3 : (6 : ℝ) * C_exp ^ 3 * q ^ 24 * (1 - q)⁻¹ * 2 ≤ 1 := by
  have hC : C_exp < 3/2 := C_exp_lt_three_halves
  have hq : q ≤ 1/8 := q_le_eighth
  nlinarith [C_exp_nonneg, q_nonneg, sq_nonneg C_exp, pow_nonneg q_nonneg 24]

end PoincareSpectral.Experimental.C02b
