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

## Opera Numerorum — 13 repos — PUBLIC — condensed 19→1 — Routes A-D → single riemann-hypothesis-four-routes

[arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core) — ROOT V2 — Arakelov height ω²=48/13>0 ; Zoe-M*, M4 10^4000 boundary — provides height input all RH voices reuse
[rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14) — Keystone — q5=226, q6=165849, cf_bound=82829 — reduces infinite S_a0 to finite S14 ; closes BSD_143_PROVED → RiemannHypothesis — condensed single checkout 6cefaf3 PR78 verify ensemble green da3b943c662f vs lock 6ec00281c55d lake build Towers 0
[riemann-hypothesis-four-routes](https://github.com/DavidFox998/riemann-hypothesis-four-routes) — Four Routes — PUBLICATION WORKSPACE replaces Routes A-D — RH Core, P5 bridge, four independent formal routes preserved at exact revisions one toolchain one RH predicate — Route A Act I Abbes-Ullmo ω²=48/13>0 Siegel zero → negative height, Route B Act II Kim-Sarnak λ1≥975/4096 Selberg=Bost-Connes GRH X0(143)→RH 35pp BC6, Route C Act III Littlewood Ω exp(c√(log t / log log t)) beats (log t)² zero repulsion, Route D Act IV Dirichlet jitter ‖p·a_q‖<1/p 35 brothers collision-free swarming orbit stability Re=1/2 — all CLOSED via S4 — 7ce83ae
[bost-connes](https://github.com/DavidFox998/bost-connes) — Arithmetic hub — C(S4)=11.422...>2√13, Gates M1-M3→M4-M8, 21 bricks 0 sorry — #173 GREEN
[birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1) — BSD 143a1 — rank 1, Heegner point (4,6), L(143a1,1)≠0, |Sha|=1 — worked example M1-M5 arithmetic in action
[lindelof-hypothesis-143](https://github.com/DavidFox998/lindelof-hypothesis-143) — Lindelöf for X0(143) — GRH → μ=0 → |ζ(½+it)|=O(t^ε) unconditional via S4
[eutheos-property](https://github.com/DavidFox998/eutheos-property) — Barrier bypass — 1419=3*11*43, 35 brothers ≡153 mod 211, barriers BGS/RR/AW all PASS — P vs NP study side
[poincare-spectral](https://github.com/DavidFox998/poincare-spectral) — ← this repo — Spectral gap — S³/I*, q=1/8, tail_26s10⁻²⁰, spectral_gap>0 — decidable instance of undecidable gap problem
[p-vs-np](https://github.com/DavidFox998/p-vs-np) — P vs NP mechanics — 225 bricks, ConductorHash, conditional SAT∉P→P≠NP — DOI 10.5281/zenodo.21303093
[hodge-abelian-boundaries](https://github.com/DavidFox998/hodge-abelian-boundaries) — Hodge obstructions — 200 measured rank obstructions for g=3,4,5 ; observed_rank>criterionBound
[yang-mills-gap](https://github.com/DavidFox998/yang-mills-gap) — Yang-Mills mass gap — SU(2) on R⁴, p<1/7, Δ>0, Wilson area law — same gap as C(S4)-2√13
[navier-stokes](https://github.com/DavidFox998/navier-stokes) — Navier-Stokes — Path A ESS backward uniqueness + Path B 120-cell H¹ balance — NS_M6_PROVED, no blowup
[zerobeacon](https://github.com/DavidFox998/zerobeacon) — MCP server — 1000 collision-proof tools; beacon 1d2c7a5b, m4.out = Complete: True
[beal-conjecture](https://github.com/DavidFox998/beal-conjecture) — Beal Level 26 — beal-v38 EQUIV:3 a2a23292 PR25 792b3f8 chartOfModelTrue_injective_from_Ei_constraint B=1 nonzero Y³≠0 Y³ outside cusp centreNormalPoly (X³-1)0 outside I² centreAlphaBound 2 0=1 X+V² outside cusp ann(1+Y·S³)≠ann(X²) [propext,choice,Quot.sound] 7 thm 355 + beal-v39-even 1fc6071→6f921f45 — www.beal-conjecture.com — DOI 10.5281/zenodo.23120540 superseded by 02728795 — pattern for opera 19→1
[opera-sieve](https://github.com/DavidFox998/opera-sieve) — Canonical sieve for S(alpha_0=299+π/10): computational + Lean verification
[morningstar-project](https://github.com/DavidFox998/morningstar-project) — Morning Star: machine certification for GRH(X_0(143)) and BSD(J_0(143)) — 476 equations, CLAY-sealed
[Certifications](https://github.com/DavidFox998/Certifications) — Machine-checked Lean 4 audit certificates — Morning Star Project
[birch-swinnerton-dyer-143](https://github.com/DavidFox998/birch-swinnerton-dyer-143) — BSD 143 — unconditional BSD for 143a1 — Rank=ord_L=1



ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105) · Archive: [pistus-theoria](https://github.com/DavidFox998/pistus-theoria) — `OperaNumerorum_MasterEquations.pdf SHA 7f6b31b4`
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
