# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).


<!--
## [Unreleased]

### Added

### Changed

### Fixed

### Removed
-->

## [0.4.0] - 2021-10-21

### Added

- Support for:
  - `modulemd` content units (resolves modules, generates `modules.yaml`)
  - Package group content units (resolves groups, generates `comps.xml`)
  - Container volumes (no more local directory mounts)
- New plan `pulp3::in_one_container::get_logs`
  - Fetch and review django logs from inside the running Pulp container
- New `CHANGELOG.md` file for project
- Provisional helper scripts

### Changed

- Updated RPMs in `build/**/*.yaml` files
- Bumped default Pulp-in-one-container image to `docker.io/pulp/pulp:3.15`
- Cleaned up root directory, gem deps, Bolt project
- Simplified plans' internal code

### Removed

- Local mount directories for Pulp-in-one-container
- (Incomplete) never-used plans `::rpm::mirror` and `::rpm::repo`

### Fixed

- Filter for podman matching
- Container destruction
- Bumped the pulp image to 3.15 to fix EPEL issues

## [0.3.0] - 2021-08-26

### Added

* Bolt project & scripts ready for sharing with the team

## [0.2.0] - 2021-08-11

### Added

* `slim_modular_repodata_fix.rb` script to correct post-slimmed modulemd data

## [0.1.0] - 2021-05-20

### Added

* Initial working direct download + Pulp uploads

[0.1.0]: https://github.com/op-ct/puppetsync/releases/tag/0.1.0
[0.2.0]: https://github.com/op-ct/puppetsync/compare/0.1.0...0.2.0
[0.3.0]: https://github.com/op-ct/puppetsync/compare/0.2.0...0.3.0
[0.4.0]: https://github.com/op-ct/puppetsync/compare/0.3.0...0.4.0
[Unreleased]: https://github.com/op-ct/puppetsync/compare/0.4.0...HEAD
