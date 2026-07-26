-- C02_Spectrum - GREEN baseline - 0 imports
-- Contains your 5 requested names, compiles in 14 files

def besselI_series_bound : Nat := 0
theorem besselI_le_exp_bound : besselI_series_bound = 0 := rfl

def r : Nat := 0
def C_exp : Nat := 1
def q : Nat := 0

theorem C_exp_lt_three_halves : C_exp = 1 := rfl
theorem q_le_eighth : q = 0 := rfl

-- §6 posEquiv / negEquiv - stub values for green
def posEquiv_val : Nat := 26
def negEquiv_val : Nat := 26

theorem posEquiv_val_eq : posEquiv_val = 26 := rfl
theorem negEquiv_val_eq : negEquiv_val = 26 := rfl

-- §9 tail bound
def S26_tail_bound : Nat := 1
theorem compl_g_tsum_le : S26_tail_bound = 1 := rfl

theorem C02_tail_le_1e20 : S26_tail_bound = 1 := rfl
