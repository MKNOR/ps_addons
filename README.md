# Project Skyreach Addons

Public catalog of addons distributed through the [Project Skyreach launcher](https://github.com/MKNOR/Project_Skyreach_Launcher). The launcher reads `addons.json` from this repo's `main` branch and downloads each addon's zip from the `url` listed there.

## Adding or updating an addon

1. **Package it.** Zip the addon's folder(s) exactly as they should land in `Interface/AddOns` — the launcher extracts the zip contents directly there, so the top level of the zip should be the addon folder(s) (e.g. `Bagnon/`, or `DBM-Core/` + `DBM-Skyreach/` for a multi-folder addon), not a wrapper folder.
2. **Add it to `Addons/`.** Commit the zip into this repo's `Addons/` folder, named `AddonName-version.zip`, and push. GitHub serves it directly via `raw.githubusercontent.com` — no separate release needed.
3. **Hash it.** Run `scripts/Get-AddonHash.ps1 -Path Addons\AddonName-version.zip` to get the `sha256` and `size` values.
4. **Update the manifest.** Add or edit the addon's entry in `addons.json`:
   ```json
   {
     "name": "AddonName",
     "version": "1.0.0",
     "category": "Bags & Inventory",
     "description": "One line about what it does.",
     "url": "https://raw.githubusercontent.com/MKNOR/ps_addons/main/Addons/AddonName-1.0.0.zip",
     "sha256": "<from step 3>",
     "size": <from step 3>
   }
   ```
   `description` and `category` are both shown in the launcher, so keep the description short — it's shown truncated to one line in the addon list. `category` is freeform text; pick something from what's already in use below or start a new one that fits: `Bags & Inventory`, `Boss Mods & Raid Tools`, `UI & Interface`, `Quality of Life`, `Roguelite Mechanics`.
5. **Push to `main`.** The launcher fetches the manifest fresh each time it loads the Addons tab, so changes go live as soon as they're on `main` — no launcher release needed.

To push an update to players who already have the addon installed, bump `version` and change `sha256`/`url` to the new zip — the launcher shows an "Update" button for anyone with a stale hash recorded locally.

## Removing an addon

Delete its entry from `addons.json` and push. It disappears from the list for anyone browsing the Addons tab; players who already installed it keep their local copy until they click Delete themselves.
