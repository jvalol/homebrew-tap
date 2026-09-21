# jvalol/homebrew-tap

Homebrew casks for my Mac apps.

```
brew install --cask jvalol/tap/oncue
```

`brew upgrade --cask oncue` picks up new releases. OnCue has no updater of its own
and no network entitlement, so Homebrew is how it gets updated.

## Casks

| Cask | What it is |
| --- | --- |
| [oncue](Casks/oncue.rb) | Menu bar app that records when the Mac's camera or microphone sees activity. [Site](https://oncue-web.netlify.app/) |

## Uninstalling

```
brew uninstall --cask oncue
```

That removes the app and quits it if it is running. `brew uninstall --zap --cask oncue`
also clears its sandbox container and preferences. Neither touches recordings: those
stay in `~/Movies/OnCue`, or wherever you pointed it.
