# Sales Cloud Learning Journey

## Retrieving metadata from orgs

`sf project retrieve start` now requires explicit metadata selection when the target org does **not** support source tracking (for example production orgs or scratch orgs created with `--no-track-source`).

Use the repository helper script to work for both source-tracking and non-source-tracking orgs:

```bash
./scripts/retrieve-metadata.sh --target-org <org-alias>
```

By default, the script runs:

```bash
sf project retrieve start --source-dir force-app/main/default --target-org <org-alias>
```

If you want a different retrieval mode, pass one of the explicit metadata flags directly:

```bash
./scripts/retrieve-metadata.sh --target-org <org-alias> --manifest manifest/package.xml
./scripts/retrieve-metadata.sh --target-org <org-alias> --metadata ApexClass:MyClass
./scripts/retrieve-metadata.sh --target-org <org-alias> --package-name "My Package"
./scripts/retrieve-metadata.sh --target-org <org-alias> --target-metadata-dir mdapi-out
```

Optional: set a default source directory once per shell session:

```bash
export SF_RETRIEVE_SOURCE_DIR=force-app/main/default
```
