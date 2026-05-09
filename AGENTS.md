# AGENTS.md — Mata Foundry Digital Assets

## Project Overview

`mf-assets` is a free, open-source (MIT) Blender asset library. It distributes Geometry Node-based VFX tools for 3D/CG work — camera rigs, cloth sims, and hair effects. The repo contains **no traditional code**; the entire product is a single `.blend` file with embedded node graphs, plus preview icon PNGs.

Current assets (first release):
- **Camera Alexa 65 Anamorphic** — ARRI Alexa 65 cinema camera rig with anamorphic lens
- **Detangle Cloth** — Geometry Nodes modifier that untangles intersecting cloth
- **Fake Wind Cloth** — Geometry Nodes wind simulation for cloth meshes
- **Fake Wind Hair Curves** — Geometry Nodes wind effect for hair curves

## Tech Stack

| Layer | Technology |
|---|---|
| Platform | Blender 5.1+ `.blend` file |
| Asset logic | Geometry Nodes + Shader Nodes |
| Icons | Affinity Designer (source) → PNG export (deliverable) |
| Versioning | Git, single `main` branch |
| Package manager | None |
| Build system | None |
| Tests | None (visual validation in Blender) |
| Lint/format | None |

## Directory Structure

```
.
├── assets/                        # Asset library deliverable
│   ├── fx_mfAssets_main.blend     # Main Blender file (~1.6 MB, Zstd compressed)
│   └── blender_assets.cats.txt    # Asset catalog (UUID → path)
├── icons/                         # Asset preview PNGs + Affinity source
│   ├── camera.alexa65.png
│   ├── detanglecloth.png
│   ├── fakewindcloth.png
│   ├── fakewindhair.png
│   └── mf-assets-icons.af
├── README.md
├── LICENSE                        # MIT
└── .gitignore                     # Ignores .DS_Store, *.blend1
```

No `src/`, `package.json`, `Makefile`, or CI config.

## Key Files

| File | Purpose |
|---|---|
| `assets/fx_mfAssets_main.blend` | The entire product — all node groups, objects, materials, node trees |
| `assets/blender_assets.cats.txt` | Catalog definition: UUID `d8639a28-...` → path `_MF Assets` |
| `README.md` | User-facing install/usage docs |
| `icons/*.png` | Asset preview thumbnails for Blender's Asset Browser |
| `icons/mf-assets-icons.af` | Editable Affinity Designer source for all icons |

## Asset Organization (inside the .blend)

- **Catalog**: All assets under `_MF Assets` (underscore prefix sorts first in Asset Browser)
- **Node group naming**: `NT<Name>` — e.g. `NTDetangle Cloth`, `NTFake Wind Hair Curves`
- **Object naming**: `bOB<Name>` or `OB<Name>` — e.g. `bOBCamera.Alexa65.Anamorphic`, `OBCloth`
- **Mesh objects**: `OBSuzanne` (test/demo meshes, ×2)
- **Collections**: `Scene Collection`, `camera`, `geo`
- **Key node groups**: `NTDetangle Cloth`, `NTSurface Deform`, `NTCurve Info`, `NTCurve Segment`, `NTShape Range`, `NTDuplicate Hair Curves`, `NTShrinkwrap Hair Curves`, `NTFake Wind Hair Curves`, `kNTFake Wind Cloth`

## External Dependencies (hard-referenced in .blend)

- **Flip Fluids addon** — materials library (FF Water, FF Beer, FF Blood, etc.) for rendering
- **Blender bundled hair assets** — `procedural_hair_node_assets.blend` (Smooth, Clump, Frizz nodes)
- These are developer-machine paths; users need the addons installed for full functionality

## Conventions

- **File names**: lowercase with underscores — `camera.alexa65.png`, `fakewindcloth.png`
- **Commits**: conventional, descriptive messages
- **Git**: single `main` branch, no GitHub workflows/actions
- **No version tags or release artifacts** — the `.blend` file itself is the version

## Common Tasks for Agents

### Installing/using the assets
1. Clone repo: `git clone https://github.com/vngnc3/mf-assets.git`
2. In Blender → Preferences → File Paths → Asset Libraries, add the `assets/` directory
3. Open Asset Browser, select `_MF Assets` catalog, drag assets into scene

### Adding a new asset
1. Open `assets/fx_mfAssets_main.blend` in Blender
2. Create Geometry Node group with `NT` prefix naming
3. Mark as asset, assign to `_MF Assets` catalog
4. Create/export a PNG preview icon to `icons/`
5. Update `icons/mf-assets-icons.af` with the new icon design
6. Save and close the `.blend`

### Updating icons
1. Edit `icons/mf-assets-icons.af` in Affinity Designer
2. Export individual PNGs to `icons/`
3. Reassign previews to assets inside the `.blend` if needed

### Versioning
- Bump version by committing a new `.blend` with changes
- Consider tagging releases: `git tag v1.0.0`

## Notes

- `.blend1` files are Blender auto-backups and are gitignored
- The `.blend` is Zstandard-compressed (Blender 5.1+ default)
- Preview icons are embedded in the `.blend` as asset metadata, but source PNGs live in `icons/`
- This repo is at an early stage (initial commit) — conventions may evolve
