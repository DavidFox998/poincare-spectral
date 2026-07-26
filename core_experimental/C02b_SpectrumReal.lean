/-
C02b_SpectrumReal — MINIMAL GREEN - fixed linarith
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

lemma C_exp_lt_three_halves : C_exp < 3/2 := by
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
      have hle : Real.exp (1/4) ≤ 4/3 := by nlinarith [mul_le_mul_of_nonneg_left h_neg hpos.le]
      linarith

lemma q_nonneg : 0 ≤ q := by unfold q r; norm_num
lemma q_lt_one : q < 1 := by unfold q r; norm_num
lemma q_le_eighth : q ≤ 1/8 := by unfold q r; norm_num

lemma inv_one_sub_q_le : (1 - q)⁻¹ ≤ 8/7 := by
  rw [show (8:ℝ)/7 = ((7:ℝ)/8)⁻¹ from by norm_num]
  apply inv_le_inv_of_le (by norm_num)
  linarith [q_le_eighth]

theorem tail_numeric_bound : (324 : ℝ) / (7 * 8 ^ 24) ≤ 1 / 10 ^ 20 := by norm_num

theorem tail_bound_S3 : (6 : ℝ) * C_exp ^ 3 * q ^ 24 * (1 - q)⁻¹ * 2 ≤ 1 := by
  have hC3 : C_exp ^ 3 ≤ (3/2 : ℝ) ^ 3 := pow_le_pow_left C_exp_nonneg C_exp_lt_three_halves.le 3
  have hq24 : q ^ 24 ≤ (1/8 : ℝ) ^ 24 := pow_le_pow_left q_nonneg q_le_eighth 24
  have h1 : 6 * C_exp ^ 3 * q ^ 24 ≤ 6 * (3/2 : ℝ) ^ 3 * (1/8 : ℝ) ^ 24 := by
    nlinarith [pow_nonneg q_nonneg 24]
  have h_each : 6 * C_exp ^ 3 * q ^ 24 * (1 - q)⁻¹ ≤ 162 / (7 * 8 ^ 24 : ℝ) := by
    calc 6 * C_exp ^ 3 * q ^ 24 * (1 - q)⁻¹
        ≤ 6 * (3/2 : ℝ) ^ 3 * (1/8 : ℝ) ^ 24 * (8/7) :=
          mul_le_mul h1 inv_one_sub_q_le (by positivity) (by positivity)
      _ = 162 / (7 * 8 ^ 24 : ℝ) := by norm_num
  have h2 : 6 * C_exp ^ 3 * q ^ 24 * (1 - q)⁻¹ * 2 ≤ 324 / (7 * 8 ^ 24 : ℝ) := by linarith
  have h3 : (324 : ℝ) / (7 * 8 ^ 24) ≤ 1 := by norm_num
  linarith

end PoincareSpectral.Experimental.C02b
