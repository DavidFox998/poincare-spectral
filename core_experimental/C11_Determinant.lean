import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C11

-- Keep independent, same as C10
noncomputable def q : ℝ := 1/8
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹
noncomputable def conductor_gap : ℝ := 1 - tail_26

-- Zeta model from C09/C10
noncomputable def zetaTerm (n : ℕ) : ℝ := (q ^ (2:ℝ)) ^ n

-- Log-det model: -ζ'(0) = -∑ log(q²) * (q²)^n /... >0 because log(q²)<0
-- We avoid deriv by defining the series for ζ' directly, majorized by q
noncomputable def zetaDerivTerm (n : ℕ) : ℝ := Real.log (q ^ (2:ℝ)) * (q ^ (2:ℝ)) ^ n
noncomputable def logDet : ℝ := - (∑' n : ℕ, zetaDerivTerm n)

lemma q_nonneg : 0 ≤ q := by unfold q; norm_num
lemma q_lt_one : q < 1 := by unfold q; norm_num
lemma q_pos : 0 < q := by unfold q; norm_num

lemma q_sq_nonneg : 0 ≤ q ^ (2:ℝ) := Real.rpow_nonneg q_nonneg _
lemma q_sq_lt_one : q ^ (2:ℝ) < 1 := by unfold q; norm_num
lemma q_sq_pos : 0 < q ^ (2:ℝ) := Real.rpow_pos_of_pos q_pos _

lemma log_q_sq_neg : Real.log (q ^ (2:ℝ)) < 0 := by
  apply Real.log_neg; exact q_sq_pos; exact q_sq_lt_one

lemma summable_zeta : Summable (fun n : ℕ => (q ^ (2:ℝ)) ^ n) :=
  summable_geometric_of_lt_one q_sq_nonneg q_sq_lt_one

lemma summable_zetaDeriv : Summable (fun n : ℕ => zetaDerivTerm n) := by
  unfold zetaDerivTerm
  have : Summable (fun n : ℕ => (q ^ (2:ℝ)) ^ n) * Real.log (q ^ (2:ℝ))) :=
    summable_zeta.mul_left _
  -- mul_comm to match form
  have h : (fun n => Real.log (q ^ (2:ℝ)) * (q ^ (2:ℝ)) ^ n) = fun n => (q ^ (2:ℝ)) ^ n * Real.log (q ^ (2:ℝ))) := by
    funext n; ring
  rw [h]; exact this

lemma tail_pos : 0 ≤ tail_26 := by unfold tail_26 q; positivity
lemma gap_pos : 0 < conductor_gap := by unfold conductor_gap tail_26 q; norm_num

-- Main: logDet >0 because -log(q²)>0 and tail sum >0
lemma logDet_pos : 0 < logDet := by
  unfold logDet
  -- ∑' log(q²)*(q²)^n = log(q²) * ∑' (q²)^n, and log(q²)<0, sum>0
  have h_sum_pos : 0 < ∑' n : ℕ, (q ^ (2:ℝ)) ^ n := by
    have h0 : 0 ≤ ∑' n : ℕ, (q ^ (2:ℝ)) ^ n := by
      apply Summable.tsum_nonneg; intro n; positivity
    -- first term =1, so sum ≥1
    have h1 : 1 ≤ ∑' n : ℕ, (q ^ (2:ℝ)) ^ n := by
      have := summable_zeta.sum_le_tsum 0 (by intro n; positivity)
      simp at this ⊢
      -- ∑' ≥ (q²)^0 =1
      calc 1 = (q ^ (2:ℝ)) ^ 0 := by simp
        _ ≤ ∑' n : ℕ, (q ^ (2:ℝ)) ^ n := this
    linarith
  have h_log_neg : Real.log (q ^ (2:ℝ)) < 0 := log_q_sq_neg
  -- rewrite tsum of product
  have h_eq : ∑' n : ℕ, zetaDerivTerm n = Real.log (q ^ (2:ℝ)) * ∑' n : ℕ, (q ^ (2:ℝ)) ^ n := by
    unfold zetaDerivTerm
    rw [← Summable.tsum_mul_left]
  rw [h_eq]
  -- -(negative * positive) = positive
  have : 0 < -(Real.log (q ^ (2:ℝ)) * ∑' n : ℕ, (q ^ (2:ℝ)) ^ n) := by
    apply mul_pos_of_neg_of_neg
    · linarith
    · exact h_sum_pos
  simpa [neg_mul] using this

theorem poincare_determinant_main :
  0 < logDet ∧ 0 < conductor_gap ∧ Summable (fun n => (q ^ (2:ℝ)) ^ n) :=
  ⟨logDet_pos, gap_pos, summable_zeta⟩

theorem poincare_spectral_determinant_pos : 0 < logDet := logDet_pos

end PoincareSpectral.Experimental.C11
