# junzh0u/homebrew-tap

Homebrew casks for apps not in Homebrew's official taps.

```sh
brew tap junzh0u/tap
brew install --cask junzh0u/tap/115life
```

| Cask | App |
|---|---|
| `115life` | [115生活](https://115.com/), the 115.com cloud storage and offline download client (Apple silicon) |
| `rex` | [Rex](https://www.superlogical.com/rex), the terminal multiplexer for people and agents (beta channel) |

## Updating a cask

These apps update themselves after install, so a cask's version only sets what a fresh install starts from.

`115life` bumps itself: 115 publishes no version feed, so a daily workflow ([`bump-115life.yml`](.github/workflows/bump-115life.yml)) runs [`scripts/bump-115life`](scripts/bump-115life), which probes the DMG URLs of the next likely versions, verifies the newest DMG's app version and 115's Developer ID signature, and commits the new `version` and `sha256`. It can miss a release that jumps further than it probes; bump that one by hand.

`rex` has a Sparkle appcast, so `brew livecheck --cask junzh0u/tap/rex` reports new releases; bump it by hand.

To bump a cask by hand, change `version`, then refresh the checksum and check the result:

```sh
brew fetch --cask junzh0u/tap/<cask>     # prints the new sha256 on mismatch
brew style junzh0u/tap && brew audit --cask --strict junzh0u/tap/<cask>
```
