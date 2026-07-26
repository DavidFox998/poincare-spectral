
### 2. `core/README.md` — Create new file:

```md
# core/ — Stable Geometric Base
**Status: GREEN base, never red**

## Layperson
This is the shape of the drum. S³ is the 3-sphere, C01 defines it, C02 defines its frequencies. No analysis yet.

## Referee
- `C01_S3.lean`: S³ model, uses `Mathlib.Geometry`
- `C02_Spectrum.lean`: Laplacian spectrum placeholder, `noncomputable def`
- No `sorry`, no analysis, pure definitions — stable for tower.

## Mathlib vs Not
In mathlib: S³ definitions. NOT: Poincaré-specific spectrum (we define custom).

## For Future
Keep this folder GREEN, don't add analysis here.
