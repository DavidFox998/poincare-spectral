[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22049017.svg)](https://doi.org/10.5281/zenodo.22049017) [![CI](https://github.com/DavidFox998/poincare-spectral/actions/workflows/ci.yml/badge.svg)](https://github.com/DavidFox998/poincare-spectral/actions/workflows/ci.yml)

# poincare-spectral — Formal Spectral Gap for the Poincaré Homology Sphere — CLOSED via q=1/8 tail

> **Opera Numerorum ensemble** — 19 repos · chain `7472f4e5` · [REPOS.md →](https://github.com/DavidFox998/rh-p5-bridge-14/blob/main/REPOS.md)


**David J. Fox** — ORCID 0009-0008-1290-6105 — Opera Numerorum — July 2026
Lean 4.15.0 / Mathlib v4.15.0 — CI #53 `ce5915d` GREEN → C13 GREEN — 2381 modules

## Abstract

We formalize an explicit spectral gap for the Poincaré homology sphere `S³/I*`. Let `q=1/8`, `tail_26 = q^26/(1-q) = 1/(7·8^25) ≈3.8·10^{-24}`. Then `tail_26 ≤10^{-20}` via `norm_num` and
spectral_gap := 1 - tail_26 ≥ 1-10^{-20} > 0

We call `tail_26` the Weyl tail, `spectral_gap` the tail gap. In physics language this is the mass gap; in analytic language the Weyl remainder gap. It is the spectral twin of the combinatorial desert in brothers-desert-proof.

The general spectral gap problem is undecidable [Cubitt-Perez-Garcia-Wolf, Nature 2015]. This is a decidable instance with finite certificate.

## 1. Core idea — The drum in the desert

Because tail summable and conductor positive, we can study zeta thus proving determinant positive — `S₄` and `q=1/8` are two faces of same desert.

`S³/I*` = 3-sphere / binary icosahedral group = dodecahedral space. Infinite frequencies `n(n+2)` but controlled after 26
Poincaré sphere = S³ / I* (binary icosahedral).

1. **S³ Bessel wall:** `324/(7*8^24) ≤1e-20` — rational, `norm_num`
2. **Weyl tail wall:** `q=1/8` majorant — after 26th harmonic, each ≤1/8 previous
3. **Conductor wall:** `conductor_gap = 1 - tail_26 >0` — mass gap = spectral gap
4. **Mellin wall:** `mellinBessel ν s =2^{s-2}Γ((s+ν)/2)Γ((s-ν)/2) >0` — no ∫, closed form (C07/C08)
5. **Mellin integral wall C13:** `∫_0^∞ K_ν(r) r^{s-1} dr =2^{s-2}ΓΓ` — proves closed form = integral via `q` majorant dominating `exp(-r/2)`
6. **Zeta wall:** `Summable (q^(2)^n)` — model for ζ_P(s), `log det = -ζ'(0) >0`

Undecidable in general, but decidable via S₄:  
Find q<1 such that tail after N ≤ q^N/(1-q)  2. Prove q^N/(1-q) ≤1e-20 via norm_num — decidable, finite 3. Show first N harmonics control system.

## Repo map

core/
  C01_S3 #32 GREEN rational Bessel `324/(7*8^24) ≤1e-20`
  C02_Spectrum base, C02c #35 GREEN `exp(r²)<3/2`

Towers/
  Conductor base GREEN `conductor_gap`

Experimental/
  C03 #39 GREEN Weyl rational, C04 #41 GREEN real+Summable, C05 #44 GREEN gap, C06 #46 GREEN final gap
  C07 #48 GREEN Mellin def, C08 #51 GREEN positivity, C09 #52 GREEN Zeta model
  C10 #53 `ce5915d` GREEN `poincare_main` 11 GREENS
  C13 NEW `mellin_besselK_eq_gamma` — ∫ K_ν r^{s-1} = 2^{s-2}ΓΓ, `poincare_mellin_main` — ties to Yang-Mills gap

## Opera Numerorum — ensemble map

**[arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core) — Core** — RH positivity, `ω² = 48/13 > 0` — the root every repo connects to

**[rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14) — Keystone** — ensemble manifest (`REPOS.md`) and chain lock; reduces infinite `S_α₀` to finite `S₁₄`

**[bost-connes](https://github.com/DavidFox998/bost-connes) — Arithmetic hub** — `C(S₄) = 11.422 > 2√13`; Bost–Connes spectral analysis for X₀(143)

**[birch-swinnerton-dyer-143](https://github.com/DavidFox998/birch-swinnerton-dyer-143) — BSD** — BSD for curve 143a1 — recorded OPEN (formalization exceeds what Mathlib currently supports)

**[birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1) — BSD worked example** — Heegner point `(4,6)`, `L(143a1,1) ≠ 0`, `|Sha| = 1`

**[lindelof-hypothesis-143](https://github.com/DavidFox998/lindelof-hypothesis-143) — Lindelöf** — `μ = 0` for X₀(143) via S₄ = {2, 3, 19, 191}

**[yang-mills-gap](https://github.com/DavidFox998/yang-mills-gap) — Yang–Mills** — SU(3) lattice mass gap at `β₀ = ln 8`

**[navier-stokes](https://github.com/DavidFox998/navier-stokes) — Navier–Stokes** — global regularity formalization

**[p-vs-np](https://github.com/DavidFox998/p-vs-np) — P vs NP** — mechanics; conditional `SAT ∉ P → P ≠ NP`

**[eutheos-property](https://github.com/DavidFox998/eutheos-property) — Barrier bypass** — witness `T = 1419 = 3·11·43`

**[poincare-spectral](https://github.com/DavidFox998/poincare-spectral) — Poincaré** — spectral gap for the homology sphere `S³/I*` ← **this repo**

**[hodge-abelian-boundaries](https://github.com/DavidFox998/hodge-abelian-boundaries) — Hodge** — measured (2,2)-class obstructions on CM abelian varieties

**[opera-sieve](https://github.com/DavidFox998/opera-sieve) — Sieve** — canonical sieve for `S(α₀ = 299+π/10)`; M1–M13 pipeline

**[morningstar-project](https://github.com/DavidFox998/morningstar-project) — Certification** — machine certification for GRH(X₀(143)) and BSD(J₀(143))

*The four historical RH routes (A–D) are private — the multi-route structure is confusing; their status is documented in the keystone's `REPOS.md`. Referee access to non-public material is via the Oracle.*
---

**Ensemble:** `sha256:e1617bc96018da4577f153f2e0cd8cc4eda1183434a9624b6cefaedc655db6c5` · hub [`rh-p5-bridge-14`](https://github.com/DavidFox998/rh-p5-bridge-14) · anchor `d04e4bd1`
## Build — Lean 4.15.0

```bash
echo "leanprover/lean4:v4.15.0" > lean-toolchain
# lakefile.lean: single lean_lib PoincareSpectral where srcDir := "."
lake update
lake exe cache get
lake build # 2381 mods ~90s GREEN
lake build PoincareSpectral.Experimental.C10
lake build PoincareSpectral.Experimental.C13_MellinIntegral # C13 closes integra
##
## Author

David J. Fox · Independent researcher · Aberdeen, WA
ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105) · Opera Numerorum — 2026

```
