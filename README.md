# bgarner config

Personal, portable config files for Omarchy systems.

This repo is rooted at `~/.config` and uses a deny-by-default `.gitignore`.
That is intentional: `~/.config` also contains browser profiles, cookies,
OAuth tokens, cloud credentials, app databases, generated caches, and
machine-specific state.

## Risks

- `hypr/monitors.conf` is machine-specific and is intentionally ignored. A
  desktop `DP-1` layout can be wrong for a laptop panel like `eDP-1`.
- Auth files are intentionally ignored, including `gh/hosts.yml`, Google Cloud
  credentials, browser state, app cookies, and local databases.
- Large Omarchy theme/background assets are intentionally ignored. Add a small
  curated theme directory later if needed, or use Git LFS for large assets.
- Some config assumes installed programs, fonts, or package versions. Pulling
  this repo onto another Omarchy install may require installing the same tools.

## First setup on another Omarchy machine

From a fresh machine, back up existing config first:

```bash
mv ~/.config ~/.config.before-config-repo
git clone https://github.com/bgarner/config ~/.config
```

If you already have local config you want to keep, clone elsewhere and copy or
merge files manually:

```bash
git clone https://github.com/bgarner/config ~/config-repo
```

## Daily use

```bash
cd ~/.config
git status
git pull
git add <reviewed-path>
git commit -m "Update config"
git push
```

Only add files after reviewing them. For ignored files that are safe and
intentional:

```bash
git add -f path/to/file
```
