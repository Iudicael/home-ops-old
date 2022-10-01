<div align="center">

<img src="https://raw.githubusercontent.com/siderolabs/talos/main/website/assets/icons/logo.svg" align="center" width="144px"/>

### Talos Linux cluster

... managed with Talhelper :robot:

</div>

## :book:&nbsp; Overview

This directory contains my [Talos](https://www.talos.dev/) Kubernetes cluster in declarative state.
I use the awesome tool [Talhelper](https://github.com/budimanjojo/talhelper) written by [@budimanjojo](https://github.com/budimanjojo) to generate the `machineconfig` files of all my nodes.
The secrets are encrypted with [SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/).

Feel free to open a [Github issue](https://github.com/Iudicael/home-ops/issues/new/choose) if you have any questions.

---

## :scroll:&nbsp; How to apply

1. Prepare your nodes with `Talos Linux`
2. Install `talhelper`.
3. Create your own [talconfig.yaml](https://github.com/budimanjojo/home-cluster/blob/main/talos/talconfig.yaml).
4. Run `talhelper genconfig` and the files will be generated in `./clusterconfig` directory by default.
5. Copy the generated `./clusterconfig/talosconfig` to your `~/.talos/config`.
6. Run `talosctl -n <node-ip> apply-config --insecure ./clusterconfig/<clustername>-<hostname>.yaml` on each of your node. Don't forget to run `talosctl -n <node-ip> bootstrap` on one of your controlplane node.

---

## :memo:&nbsp; After bootstrap

After you're done with bootstrapping, you can now install `Cilium`.
You can do `kubectl kustomize --enable-helm ./cni | kubectl apply -f -` to do this.
