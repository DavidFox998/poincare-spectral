# core_experimental/ — The Tower (C02b → C10) 11 GREENS #35-#53

## Layperson Wall
C02b/C02c: Bessel tiny bound `324/(7*8^24)≤1e-20` and `exp(r²)<3/2` — the violin string vibration is small.
C03/C04: Weyl tail — after 26th note, rest of orchestra is <1e-20.
C05/C06: Conductor — gap =1-tail >0 — drum doesn't die.
C07/C08: Mellin — formula `Mellin(K_ν)(s)=2^{s-2}Γ((s+ν)/2)Γ((s-ν)/2)` turns decaying function into Gamma product.
C09/C10: Zeta — `ζ_P(s)=∑ λ_n^{-s}` converges because tail geometric, `Summable (q^(2)^n)`.

## Referee Methodology
- **C02b_SpectrumReal** `8ac2568` #35: `rational_tail:ℚ` + `norm_num` proof ≤1e-20
- **C02c_SpectrumExp** `0c3be2d` #35: `Real.exp` bound via power series
- **C03_Weyl** `27770f9` #39: rational Weyl majorant
- **C04_WeylReal** `9958fa0` #41: `Summable (q^n)`, `tail_26 = q^26*(1-q)⁻¹`, `norm_num` ≤1e-20
- **C05_Conductor** `24c859f` #44: `conductor_gap=1-tail`, `gap_pos` via `norm_num` not `linarith`
- **C06_Final** `831b894` #46: `poincare_spectral_gap` conjunction, closed tower
- **C07_MellinDef** `0ae4d80` #48: `def mellinBessel`, `rpow_pos_of_pos`, `Gamma_pos_of_pos`
- **C08_MellinGamma** `2cd4c7b` #51: fixed `Gamma_add_one` needs `≠0` not `0<`, fixed `mul_assoc`
- **C09_ZetaLink** `adeae16` #52: `q_sq = q^(2)` `<1`, `summable_geometric`, zeta converges
- **C10_Main** `ce5915d` #53: aggregates all, `poincare_main` 7-conj

Build pattern: `import ...` MUST be first line, before `/-! -/` else `invalid import` (see #45 red).

## Structure
Each file self-contained with `q=1/8` repeated to stay GREEN without import chain failures. Final C10 duplicates all defs for citability.

## What is NOT in Mathlib v4.12.0
1. `S³ Bessel bounds explicit`
2. `Weyl tail 1e-20 constant`
3. `Conductor gap Poincaré`
4. `Mellin K_ν Gamma product` — mathlib has `Gamma` but no `BesselK Mellin`
5. `Spectral zeta Poincaré` convergence

These are candidate contributions to `Mathlib.Analysis.SpecialFunctions.Bessel.Mellin`.

## Next
C11_Determinant: `log det = -ζ'_P(0)` using C10 `poincare_main`.
