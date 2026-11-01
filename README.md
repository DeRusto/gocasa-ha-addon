# GoCasa Home Assistant add-on

[GoCasa](https://github.com/DeRusto/goCasa) is a self-hosted family wall calendar: calendars, chores, to-dos, shopping lists, weather and a photo screensaver.

## Install

Needs Home Assistant OS or Supervised (add-ons aren't available on Container or Core installs; run GoCasa's Docker image next to Home Assistant instead).

1. Settings → Add-ons → Add-on store → ⋮ → **Repositories**, add `https://github.com/DeRusto/gocasa-ha-addon`.
2. Install **GoCasa**, set `base_url`, start it, and open your `base_url` in a browser.

See [gocasa/DOCS.md](gocasa/DOCS.md) for the options.

Supports `amd64` and `aarch64`.
