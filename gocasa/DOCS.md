# GoCasa

A self-hosted family wall calendar: calendars, chores, to-dos, shopping lists, weather and a photo screensaver, for any tablet or screen with a browser. See the [GoCasa README](https://github.com/DeRusto/goCasa#readme) for the full feature list.

## Setup

1. Set **base_url** to the address your tablets and phones type to reach GoCasa, for example `http://homeassistant.local:8080` or `http://192.168.1.10:8080`. It must match exactly: GoCasa refuses form posts from any other address, and uses it for cookies and the `/calendar.ics` link.
2. Start the add-on and click **Open Web UI**. Add your family under Settings → Members.
3. Point a tablet's browser at the same address, and turn on **Wall display** in Settings on that device.

The time zone follows Home Assistant's.

## Options

| Option | Meaning |
|---|---|
| `base_url` | Required. How clients reach GoCasa |
| `google_client_id`, `google_client_secret` | Your own Google OAuth client, to connect Google calendars. Set both or neither. See [Google calendars](https://github.com/DeRusto/goCasa#google-calendars) |
| `google_redirect_uri` | Defaults to `<base_url>/auth/google/callback`. Google only accepts an `https` address or `http://localhost` |

## Data, secrets and backups

Everything lives in the add-on's `/data`: `app.db`, GoCasa's own nightly `backups/`, and `secrets.env`.

`secrets.env` holds the encryption key for integration tokens (Google, Immich, Mealie) and the session secret. The add-on generates it on first start. It is included in Home Assistant backups of this add-on, so anyone holding such a backup can decrypt those tokens: protect your backups (Home Assistant encrypts them by default). Losing the file means reconnecting every integration.

The add-on is stopped briefly while Home Assistant backs it up, so the database copy is consistent.

## Home Assistant calendar

To see GoCasa events in Home Assistant, add the **Remote Calendar** integration with the URL `<base_url>/calendar.ics`.

## Limits

- No sidebar panel (Ingress) yet. GoCasa opens on its own port.
- Screen Wake Lock, camera motion-wake and connecting Google need HTTPS. Put GoCasa behind your HTTPS reverse proxy and set `base_url` to that `https://` name. See [HTTPS](https://github.com/DeRusto/goCasa#https).
