# Cardano docker image

This is unofficial Cardano docker image.

It is being used internally at Coin Metrics, and is published in the hope it will be useful, but without any warranty. No support is available. You are using it at your own risk.

## Using image

[![Docker Repository on Quay](https://quay.io/repository/coinmetrics/fullnode-cardano/status "Docker Repository on Quay")](https://quay.io/repository/coinmetrics/fullnode-cardano)

```
docker pull quay.io/coinmetrics/fullnode-cardano:<version>_fork
```

## Security

This image builds binaries from sources forked by Coin Metrics, downloaded from https://gitlab.com/coinmetrics/fullnodes/forks/cardano-sl, with use of IOHK's binary cache https://hydra.iohk.io/.

Image is built on shared Gitlab CI runners provided by Gitlab.com. [CI logs](https://gitlab.com/coinmetrics/fullnodes/cardano/pipelines)

## License

Content of this repository is made available under MIT license, see LICENSE file.
Note that this repository only contains scripts to download binaries or build ones from source.
Those binaries or sources are distributed under their own licenses.
Please consult upstream documentation for details.
