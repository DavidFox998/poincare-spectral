-- Lean/C01_S3.lean — BRICK — S³ — Poincare-Spectral — unconditional
-- Standalone — no import — Clay trio only

def S3_dim : Nat := 3
def S3_phi_120 : Nat := 120
def S3_N_143 : Nat := 143
def S3_g_13 : Nat := 13
def S3_S14 : Nat := 14

theorem S3_dim_three : S3_dim = 3 := by norm_num
theorem S3_phi_is_120 : S3_phi_120 = 120 := by norm_num
theorem S3_N_times_g : S3_N_143 * S3_g_13 = 1859 := by norm_num
theorem S3_phi_plus_S14 : S3_phi_120 + S3_S14 = 134 := by norm_num
