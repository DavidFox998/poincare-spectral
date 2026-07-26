-- Towers/Conductor - N=143 chain - no sorry, no totient

def N_143 : Nat := 143
def g_X0_143 : Nat := 13
def phi_143 : Nat := 120
def S14_card : Nat := 14

theorem N_143_mul : N_143 * g_X0_143 = 1859 := rfl
theorem N_143_factor : N_143 = 11 * 13 := rfl
theorem phi_143_eq : phi_143 = 8 * g_X0_143 + 16 := rfl
theorem sum_134 : S14_card + phi_143 = 134 := rfl
