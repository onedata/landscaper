# Not a landscaper container
We intended to use [landscaper](https://github.com/Eneco/landscaper) in the continuous delivery pipeline. Unfortunately landscaper lags behind newest helm versions.

This repository build a container that holds *kubect* and *helm*.

# Versioning

Versioning of this repo will be a combination of two mian dependencies: `v<helm-version>-<this-repo-release-number>`. Eg. v2.5.0-1