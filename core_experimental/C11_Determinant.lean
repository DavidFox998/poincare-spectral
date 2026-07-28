import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C11

noncomputable def q : ℝ := 1/8
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹
noncomputable def conductor_gap : ℝ := 1 - tail_26

-- Determinant model: -log(q²) >0 is the toy log-det, positive because q²<1
noncomputable def q_sq : ℝ := q ^ (2:ℝ)
noncomputable def logDet : ℝ := - Real.log q_sq

noncomputable def zetaTerm (n : ℕ) : ℝ := q_sq ^ n

lemma q_nonneg : 0 ≤ q := by unfold q; norm_num
lemma q_lt_one : q < 1 := by unfold q; norm_num
lemma q_pos : 0 < q := by unfold q; norm_num

lemma q_sq_pos : 0 < q_sq := by unfold q_sq; exact Real.rpow_pos_of_pos q_pos _
lemma q_sq_nonneg : 0 ≤ q_sq := le_of_lt q_sq_pos
lemma q_sq_lt_one : q_sq < 1 := by unfold q_sq q; norm_num

lemma log_q_sq_neg : Real.log q_sq < 0 := by
  apply Real.log_neg q_sq_pos q_sq_lt_one

lemma logDet_pos : 0 < logDet := by
  unfold logDet
  exact neg_pos.mpr log_q_sq_neg

lemma tail_pos : 0 ≤ tail_26 := by unfold tail_26 q; positivity
lemma gap_pos : 0 < conductor_gap := by unfold conductor_gap tail_26 q; norm_num
lemma gap_lower : 1 - 1/10^20 ≤ conductor_gap := by unfold conductor_gap tail_26 q; norm_num

lemma tail_le : tail_26 ≤ 1/10^20 := by unfold tail_26 q; norm_num

lemma summable_zeta : Summable (fun n : ℕ => zetaTerm n) := by
  unfold zetaTerm
  exact summable_geometric_of_lt_one q_sq_nonneg q_sq_lt_one

theorem poincare_determinant_main :
  0 < logDet ∧ 0 < conductor_gap ∧ tail_26 ≤ 1/10^20 ∧ Summable (fun n => zetaTerm n) :=
  ⟨logDet_pos, gap_pos, tail_le, summable_zeta⟩

theorem poincare_spectral_determinant_pos : 0 < logDet := logDet_pos

theorem poincare_main_ext :
  0 < conductor_gap ∧ 0 < logDet ∧ Summable (fun n => zetaTerm n) :=
  ⟨gap_pos, logDet_pos, summable_zeta⟩

end PoincareSpectral.Experimental.C11
