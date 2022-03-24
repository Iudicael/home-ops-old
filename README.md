<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->

<div align="center">

<img src="https://camo.githubusercontent.com/5b298bf6b0596795602bd771c5bddbb963e83e0f/68747470733a2f2f692e696d6775722e636f6d2f7031527a586a512e706e67" align="center" width="144px" height="144px"/>

### My home Kubernetes cluster :sailboat:

_... managed with Flux and Renovate_ :robot:

</div>

<br/>

<!-- PROJECT SHIELDS -->

<div align="center">

[![discord][discord-shield]][discord-url]
[![k3s][k3s-shield]][k3s-url]
[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]
[![GitHub Workflow Status][renovate-shield]][renovate-url]
[![commits][commits-shield]][commits-url]
[![Lines of code][loc-shield]][loc-url]
[![terraform][terraform-shield]][terraform-url]
[![cloudflare][cloudflare-shield]][cloudflare-url]

</div>

---

## Overview

This is home to my personal Kubernetes cluster. [Flux][flux-url] watches this Git repository and makes the changes to my cluster based on the manifests in the [cluster](./cluster/) directory. [Renovate][renovate-url] also watches this Git repository and creates pull requests when it finds updates to Docker images, Helm charts, and other dependencies.

## Thanks

A lot of inspiration for my cluster came from the people that have shared their clusters over at [awesome-home-kubernetes][awesome-home-k8s-url]

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[awesome-home-k8s-url]: https://github.com/k8s-at-home/awesome-home-kubernetes
[cloudflare-url]: https://dash.cloudflare.com/
[cloudflare-shield]: https://img.shields.io/badge/cloudflare-dns-F38020?logo=cloudflare&style=for-the-badge&logoColor=white
[commits-url]: https://github.com/Iudicael/home-ops/commits/main
[commits-shield]: https://img.shields.io/github/last-commit/Iudicael/home-ops?logo=github&style=for-the-badge
[discord-url]: https://discord.gg/k8s-at-home
[discord-shield]: https://img.shields.io/discord/673534664354430999?style=for-the-badge&label=discord&logo=discord&logoColor=white
[flux-url]: https://fluxcd.io/
[k3s-url]: https://k3s.io/
[k3s-shield]: https://img.shields.io/badge/k3s-v1.23.3-ffc61c?style=for-the-badge&logo=kubernetes&logoColor=white
[k8s-at-home-url]: https://k8s-at-home.com/
[loc-url]: https://github.com/Iudicael/home-ops/graphs/contributors
[loc-shield]: https://img.shields.io/tokei/lines/github/Iudicael/home-ops?style=for-the-badge&color=brightgreen&label=lines&logo=codefactor&logoColor=white
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge
[renovate-url]: https://github.com/Iudicael/home-ops/actions/workflows/schedule-renovate.yaml
[renovate-shield]: https://img.shields.io/github/workflow/status/Iudicael/home-ops/Schedule%20-%20Renovate?label=renovate&logo=renovatebot&style=for-the-badge
[taskfile-url]: https://taskfile.dev/
[taskfile-shield]: https://img.shields.io/badge/Taskfile-Enabled-brightgreen?logoColor=white&style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAEeElEQVR4Xu2bzU8TQRjGZ7atRQKaGAVRhBakNbYkGEPVE5IoJh403rxIgpgYwOBHPBgPxoTwDyiCelIx8SwqxhilEj9ihBCDhK8g0IIiEAqlgLi1YxZdU2DpzszOfhy2174z7/P+5nlntrtbCHT83BzqQRyAH6sc7v16yYB6JO6aCXX4Q+MFy3InR1Or0jwRrfVoCgAhZKkf7osmKrLK4dZUk2bJ7gT6UTQWw1pgCGCg0uHKxgpWGKQ6gM6Z0IPW0PgpGp1auEFVALeGehFN4SvHqAlCFQB3RwYQH03Y6sRcOABeVTjch4gHygxgCiD4c+5o09jIM9Yi4+fbPfjNVlxczIwuMwCs7I4Lj1VbKAbQOPqVD/O8FVc4yzgIwcPKbDfVBivqoAaAEDpYP9zXwrIg2rmUuIEKgNZ2xwEDOQ5UZuUR10M04PnUD/Q1PI2jR7eYJA6WlWe57uEKwAIwiFBS83DfAu6kRojDbQtZAEa0OwlgORBrAngyFmwL/JzfS5LMqLGpVq60NDOvUUqfJIDL3e3IuT7FqPVQ6ZqN8uDKTu+qeiUB7GxpWrqGv+h0UyUz2qAvs3837ob8fWQAhEEchOC8w2W0mrD0dM1Og/hfY1QAxEynM3PARpsNK7HeQYuxGOifC6+SoQiAOJvR20K0u9QiMAEgTJzEcaAiO0/vhV6WvzsyA36jxLcfmAEQM5/NygXJFl1+B/0vPopioCey2u6qOmDl5Hq1RSK7awpASLbBagPlO3I0aYveSBjwCO8Ga7wg5i0gVe0FpxvIXl8rwES66poDEBIKW9ElxhdRSgoXIWjigHjiuckp4Fj6dgXrDUBgYQ6Eo7yiOXQDICa+4HABCMkaQ3CRcCXH8qO5A2hPCxZ21/wUwF0pT0oqKNmyTTJ8ZGEOTDOyu2EBiMIuOXcB9O+nitAcnYztbngAgsAYQqBky1ZVj01djkHcdhDiDm9OJwlXFKv7Jiil3gRgOsBsAUV9TTLY3ANoboqSEKaJNTdBcxM0N0GazqEaY26C5iZI8WiMymsEg8xTwDwFDHgKCA4+0daKtLhJoUULWCBsqvP6jkt1puydSvFdAYK2JgpVFQCEoMHrS1ijLAChmgl+oejA25d+osowg9UCkD45b7uO8UotFgCxFs+bp0h49s7ywxqADXKDN7yF2M/oiACIhbNsC5YApK705BaLCoAw6f1A/9Wage5auQRy37MAcM7rTPXANKr/G1EDEAsrePcCRX4tytW55vdKAFgg/F7n9Uk/ZMBUpBiA0ragBUBjd6pjEBPkUljz+Oij6q72kyRjSAFsAjCrNt8XJMmRKJaZA+KTOF4/RlbMh6G4ACx2O6hzFTDXy3zCeBA4pwUOAFZ2V70FpBKc+fzB75+aKFrLhokAbLavK6tx7cF+9Z2mLVR1AI4bpABACGP1Xp+FpiDSMZoBEIS9R8H1pf6O+XiRKwGoaXddWkAqaXXnJ7558vvSC4YigAy7veKaq+A26QoqjdfUASvF5rY0oSNpGaDeU6ibjj9v/5xQDsUWRgAAAABJRU5ErkJggg==
[terraform-url]: https://github.com/hashicorp/terraform/releases
[terraform-shield]: https://img.shields.io/badge/terraform-1.x-844fba?style=for-the-badge&logo=terraform
[zerossl-url]: https://zerossl.com/
