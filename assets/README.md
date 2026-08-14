# Blender remote asset library — repo pipeline

**STATUS: LIVE** — https://blender.mata.bot (12 assets, verified 2026-08-07)

Serves `mf-assets/assets/` (a Blender 5.2+ asset library with generated listing) from a Cloudflare R2 bucket via custom domain `blender.mata.bot`.

## layout

```
songbird/blender-assets/
├── mf-assets/          # git repo vngnc3/mf-assets
│   └── assets/         # the asset library: .blend files (self-contained), catalogs
│       ├── _asset-library-meta.json   # entry point (name/contact, generated + edited once)
│       └── _v1/                       # generated listing (index + asset pages)
├── scripts/
│   ├── build.sh        # runs: blender -b -c asset_listing generate <lib>   (run on a machine WITH blender)
│   ├── sync.sh         # runs: rclone sync lib -> r2:mf-assets
│   └── verify.sh       # curls live URL: query-string test + sha256 hash audit
└── README.md
```

## update loop (after ANY asset/catalog change)

1. on a machine with Blender 5.2+: `blender -b -c asset_listing generate /path/to/mf-assets/assets`
   (generator needs the DIRECTORY path, assets must be marked as assets; keeps meta name/contact)
2. commit + push the repo
3. on the homelab: `cd ~/songbird/blender-assets/mf-assets && git pull`
4. `./scripts/sync.sh`  (rclone sync → r2:mf-assets)
5. `./scripts/verify.sh https://blender.mata.bot` — must pass before trusting it

## rclone

- remote `r2` configured in `~/.config/rclone/rclone.conf` (chmod 600), provider=Cloudflare,
  endpoint `https://<account_id>.r2.cloudflarestorage.com`, acl=private
- binary installed at `~/bin/rclone` (not in PATH by default — export PATH="$HOME/bin:$PATH" or use ~/bin/rclone)
- token is scoped to the `mf-assets` bucket → `rclone lsd r2:` (ListBuckets) 403s, bucket ops fine. expected.
- credentials came from a one-time file (`cloudflare_tokens`, now deleted). rotate the token in the R2 dashboard if needed.

## gotchas

- cloudflare **bot fight mode blocks non-browser user agents** (python-urllib, likely Blender's own UA).
  keep it OFF for blender.mata.bot or downloads inside Blender will 403.
- every `.blend` must be self-contained: no linked files, textures **packed**. importing one asset downloads the whole file
- remote libs are append/pack only, no link
- no auth in 5.2 — bucket is public; private/paid access is a future hook
- `?hash=` in the URL is the cache-buster; the server must ignore query strings (R2 does)
- keep `obsolete/`-style dirs OUT of the library root — the generator rglobs `*.blend` recursively
- never hand-splice the generated JSON (counts vs lists desync) — always regenerate

## registering in Blender

Preferences → Asset Libraries → add online library → `https://blender.mata.bot`
(requires *Allow Internet Access* in Preferences → System → Network)
