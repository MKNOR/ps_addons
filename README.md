# Project Skyreach Addons

Public catalog of addons distributed through the [Project Skyreach launcher](https://github.com/MKNOR/Project_Skyreach_Launcher). The launcher reads `addons.json` from this repo's `main` branch and downloads each addon's zip from the `url` listed there.

## Adding or updating an addon

1. **Package it.** Zip the addon's folder(s) exactly as they should land in `Interface/AddOns` — the launcher extracts the zip contents directly there, so the top level of the zip should be the addon folder(s) (e.g. `SkyreachUI/`, or `DBM-Core/` + `DBM-Skyreach/` for a multi-folder addon), not a wrapper folder.
2. **Hash it.** Run `scripts/Get-AddonHash.ps1 -Path C:\path\to\Addon.zip` to get the `sha256` and `size` values.
3. **Publish it.** Create a [GitHub Release](https://github.com/MKNOR/ps_addons/releases/new) in this repo (tag it something like `addonname-1.0.0`) and upload the zip as a release asset. Copy the asset's download URL.
4. **Update the manifest.** Add or edit the addon's entry in `addons.json`:
   ```json
   {
     "name": "AddonName",
     "version": "1.0.0",
     "description": "One line about what it does.",
     "url": "https://github.com/MKNOR/ps_addons/releases/download/addonname-1.0.0/AddonName.zip",
     "sha256": "<from step 2>",
     "size": <from step 2>
   }
   ```
5. **Push to `main`.** The launcher fetches the manifest fresh each time it loads the Addons tab, so changes go live as soon as they're on `main` — no launcher release needed.

To push an update to players who already have the addon installed, bump `version` and change `sha256`/`url` to the new zip — the launcher shows an "Update" button for anyone with a stale hash recorded locally.

## Removing an addon

Delete its entry from `addons.json` and push. It disappears from the list for anyone browsing the Addons tab; players who already installed it keep their local copy until they click Delete themselves.
