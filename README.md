# junzh0u/homebrew-tap

Homebrew casks for apps not in Homebrew's official taps.

```sh
brew tap junzh0u/tap
brew install --cask junzh0u/tap/115life
```

| Cask | App |
|---|---|
| `115life` | [115生活](https://115.com/), the 115.com cloud storage and offline download client (Apple silicon) |
| `neteasemusic` | [网易云音乐](https://music.163.com/) (NetEase Cloud Music), homebrew/cask's cask with a workaround for macOS 27 refusing to mount its quarantined DMG (Homebrew/brew#23401); install it as `junzh0u/tap/neteasemusic` |
| `rex` | [Rex](https://www.superlogical.com/rex), the terminal multiplexer for people and agents (beta channel) |

## Updating a cask

These apps update themselves after install, so a cask's version only sets what a fresh install starts from.

`115life` bumps itself: 115 publishes no version feed, so a daily workflow ([`bump-115life.yml`](.github/workflows/bump-115life.yml)) runs [`scripts/bump-115life`](scripts/bump-115life), which probes the DMG URLs of the next likely versions, verifies the newest DMG's app version and 115's Developer ID signature, and commits the new `version` and `sha256`. It can miss a release that jumps further than it probes; bump that one by hand.

`rex` bumps itself too: a daily workflow ([`bump-rex.yml`](.github/workflows/bump-rex.yml)) asks `brew livecheck` for the newest release in Rex's Sparkle appcast, rewrites `version` and `sha256` with `brew bump-cask-pr --write-only`, audits the result, and commits it.

`neteasemusic` bumps itself the same way from NetEase's download API (the livecheck copied from homebrew/cask's cask), but [`bump-neteasemusic.yml`](.github/workflows/bump-neteasemusic.yml) also installs the new version into a scratch directory and checks NetEase's Developer ID, since the audit can't see inside the DMG the cask mounts itself. Retire the cask once homebrew/cask's `neteasemusic` installs again.

To bump a cask by hand, change `version`, then refresh the checksum and check the result:

```sh
brew fetch --cask junzh0u/tap/<cask>     # prints the new sha256 on mismatch
brew style junzh0u/tap && brew audit --cask --strict junzh0u/tap/<cask>
```
