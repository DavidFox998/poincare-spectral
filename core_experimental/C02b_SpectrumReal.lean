/-
C02b_SpectrumReal — REAL Bessel tail for S³
Ported from yang-mills-gap BesselBounds §2,3,6,9
Not built by default CI (core_experimental/ not in lakefile globs)
so repo stays GREEN while we iterate imports.
Axiom footprint: [propext, Classical.choice, Quot.sound]
-/
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Int.Interval

open Real

namespace PoincareSpectral.Experimental.C02b

/-! ## §2 C_exp < 3/2 - exact copy of your BesselBounds §2 proof -/

noncomputable def r : ℝ := 0.3465735903
noncomputable def C_exp : ℝ := Real.exp (r ^ 2)
noncomputable def q : ℝ := r ^ 3

lemma r_nonneg : 0 ≤ r := by unfold r; norm_num
lemma r_lt_half : r < 1/2 := by unfold r; norm_num
lemma C_exp_nonneg : 0 ≤ C_exp := le_of_lt (Real.exp_pos _)

lemma C_exp_lt_three_halves : C_exp < 3 / 2 := by
  unfold C_exp
  have hr_sq : r ^ 2 < 1 / 4 := by nlinarith [r_lt_half, r_nonneg]
  calc Real.exp (r ^ 2) < Real.exp (1/4 : ℝ) := Real.exp_lt_exp.mpr hr_sq
    _ < 3/2 := by
      have h_neg : (3 : ℝ) / 4 ≤ Real.exp (-1/4 : ℝ) := by
        have h := Real.add_one_le_exp (-1/4 : ℝ); linarith
      have hmul : Real.exp (1/4 : ℝ) * Real.exp (-1/4 : ℝ) = 1 := by
        rw [← Real.exp_add]; norm_num
      have hpos : (0 : ℝ) < Real.exp (1/4 : ℝ) := Real.exp_pos _
      have hle : Real.exp (1/4 : ℝ) ≤ 4/3 := by
        have h := mul_le_mul_of_nonneg_left h_neg hpos.le
        nlinarith
      linarith

/-! ## §3 q ≤ 1/8 -/

lemma q_nonneg : 0 ≤ q := by unfold q; positivity
lemma q_le_eighth : q ≤ 1/8 := by
  unfold q
  calc r ^ 3 ≤ (1/2 : ℝ) ^ 3 := pow_le_pow_left r_nonneg r_lt_half.le 3
    _ = 1/8 := by norm_num

/-! ## §6 ℕ-bijections -/

def posEquiv : ℕ ≃ {k : ℤ | k ≥ 26} where
  toFun n := ⟨↑n + 26, by simp; omega⟩
  invFun k := (k.val - 26).toNat
  left_inv n := by simp; omega
  right_inv := fun ⟨k, hk⟩ => by
    apply Subtype.ext; simp only
    rw [Int.toNat_of_nonneg (by omega)]; omega

def negEquiv : ℕ ≃ {k : ℤ | k ≤ -26} where
  toFun n := ⟨-(↑n + 26), by simp; omega⟩
  invFun k := (-k.val - 26).toNat
  left_inv n := by simp; omega
  right_inv := fun ⟨k, hk⟩ => by
    apply Subtype.ext; simp only
    rw [Int.toNat_of_nonneg (by omega)]; omega

/-! ## §9 numeric core 324/(7·8^24) ≤ 1/10^20 -/

theorem tail_numeric_bound : (324 : ℝ) / (7 * 8 ^ 24) ≤ 1 / 10 ^ 20 := by norm_num

end PoincareSpectral.Experimental.C02b
