# junzh0u/homebrew-tap

Homebrew casks for apps not in Homebrew's official taps.

```sh
brew tap junzh0u/tap
brew install --cask junzh0u/tap/115life
```

| Cask | App |
|---|---|
| `115life` | [115生活](https://115.com/), the 115.com cloud storage and offline download client (Apple silicon) |

## Updating a cask

These apps update themselves after install, so a cask's version only sets what a fresh install starts from. To bump one, change `version`, then refresh the checksum and check the result:

```sh
brew fetch --cask junzh0u/tap/<cask>     # prints the new sha256 on mismatch
brew style junzh0u/tap && brew audit --cask --strict junzh0u/tap/<cask>
```
