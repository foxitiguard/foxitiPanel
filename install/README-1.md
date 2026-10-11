# FOXITI installer starter (development only)

This bundle contains **preflight-only starter scripts**, not a production installer.

## Why installation is gated

The uploaded `hst-install-debian.sh` and `hst-install-ubuntu.sh` scripts install packages named `hestia`, `hestia-nginx`, `hestia-php`, and related packages from the Hestia package repository. Merely renaming those scripts would still install upstream packages, not a FOXITI build.

These scripts therefore:
- identify the supported OS and run basic preflight checks;
- write a restricted log under `/var/log/foxiti-installer/`;
- do not install packages or change services;
- deliberately refuse `--install` until FOXITI package/repository details are configured.

## Usage

```bash
sudo bash install/foxiti-install-debian.sh --check
sudo bash install/foxiti-install-ubuntu.sh --check
```

## Before enabling installation

1. Build FOXITI-specific `.deb` packages from the fork.
2. Decide whether internal package names and paths remain compatible or are being renamed.
3. Publish packages in a controlled repository.
4. Configure repository signing and verify package signatures.
5. Add tested dependency lists, supported OS versions, hostname/DNS checks, conflict checks, and rollback/recovery guidance.
6. Test in disposable VMs before running on a production server.
7. Review the source project's license obligations and preserve applicable notices.

Do not replace the install gate with a URL until the URL serves your own tested, signed FOXITI artifacts.
