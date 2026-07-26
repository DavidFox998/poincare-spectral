-- C01_S3 - S³ basic invariants
-- No tactics needed, just rfl

def S3_dim : Nat := 3
def S3_phi_120 : Nat := 120
def S3_S14 : Nat := 14
def S3_N_143 : Nat := 143
def S3_g_13 : Nat := 13

theorem S3_dim_eq : S3_dim = 3 := rfl
theorem S3_phi_120_eq : S3_phi_120 = 120 := rfl
theorem S3_prod : S3_N_143 * S3_g_13 = 1859 := rfl
theorem S3_sum : S3_phi_120 + S3_S14 = 134 := rfl
