import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

namespace PoincareSpectral.Experimental.C05

noncomputable def q : ℝ := 1/8
noncomputable def tail_26 : ℝ := q ^ 26 * (1 - q)⁻¹
noncomputable def conductor_gap : ℝ := 1 - tail_26

-- Re-use C04 bound, proved independently to stay green if C04 not imported
lemma tail_le_1e20 : tail_26 ≤ 1 / 10 ^ 20 := by
  unfold tail_26 q
  norm_num

lemma tail_le_one : tail_26 ≤ 1 := by
  unfold tail_26 q
  norm_num

lemma gap_pos : 0 < conductor_gap := by
  unfold conductor_gap
  linarith [tail_le_one]

lemma gap_ge : 1 - 1 / 10 ^ 20 ≤ conductor_gap := by
  unfold conductor_gap
  linarith [tail_le_1e20]

-- This is the link to Towers.Conductor:
-- spectral gap = 1 - tail ≥ 1 - 1e-20 > 0
-- So conductor ≤...
theorem poincare_conductor_pos : 0 < conductor_gap :=
  gap_pos

theorem poincare_tail_bound : tail_26 ≤ 1 / 10 ^ 20 :=
  tail_le_1e20

theorem conductor_main : conductor_gap ≥ 1 - 1 / 10 ^ 20 ∧ tail_26 ≤ 1 / 10 ^ 20 :=
  ⟨gap_ge, tail_le_1e20⟩

end PoincareSpectral.Experimental.C05
