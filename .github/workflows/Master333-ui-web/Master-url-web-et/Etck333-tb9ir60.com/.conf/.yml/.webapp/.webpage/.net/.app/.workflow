 # This is a basic workflow to help you get started with ActionsTrust Wallet Assets Info

￼

Overview

Trust Wallet token repository is a comprehensive, up-to-date collection of information about several thousands (!) of crypto tokens.

Trust Wallet uses token logos from this source, alongside a number of other projects.

The repository contains token info from several blockchains, info on dApps, staking validators, etc. For every token a logo and optional additional information is available (such data is not available on-chain).

Such a large collection can be maintained only through a community effort, so feel free to add your token.

￼

How to add token

Please note that brand new tokens are not accepted, the projects have to be sound, with information available, and non-minimal circulation (for limit details see https://developer.trustwallet.com/assets/requirements).

Assets App

The Assets web app can be used for most new token additions (Github account is needed).

Quick starter

Details of the repository structure and contribution guidelines are listed on the Developers site. Here is a quick starter summary for the most common use case.

Documentation

For details, see the Developers site:

Contribution guidelines

FAQ

Scripts

There are several scripts available for maintainers:

make check -- Execute validation checks; also used in continuous integration.

make fix -- Perform automatic fixes where possible

make update-auto -- Run automatic updates from external sources, executed regularly (GitHub action)

make add-token asset_id=c60_t0x4Fabb145d64652a948d72533023f6E7A623C7C53 -- Create info.json file as asset template.

make add-tokenlist asset_id=c60_t0x4Fabb145d64652a948d72533023f6E7A623C7C53 -- Adds a token to tokenlist.json.

make add-tokenlist-extended asset_id=c60_t0x4Fabb145d64652a948d72533023f6E7A623C7C53 -- Adds a token to tokenlist-extended.json.

On Checks

This repo contains a set of scripts for verification of all the information. Implemented as Golang scripts, available through make check, and executed in CI build; checks the whole repo. There are similar check logic implemented:

in assets-management app; for checking changed token files in PRs, or when creating a PR. Checks diffs, can be run from browser environment.

in merge-fee-bot, which runs as a GitHub app shows result in PR comment. Executes in a non-browser environment.

Trading pair maintenance

Info on supported trading pairs are stored in tokenlist.json files. Trading pairs can be updated -- from Uniswap/Ethereum and PancakeSwap/Smartchain -- using update script (and checking in changes). Minimal limit values for trading pair inclusion are set in the config file. There are also options for force-include and force-exclude in the config.

Disclaimer

Trust Wallet team allows anyone to submit new assets to this repository. However, this does not mean that we are in direct partnership with all of the projects.

Trust Wallet team will reject projects that are deemed as scam or fraudulent after careful review. Trust Wallet team reserves the right to change the terms of asset submissions at any time due to changing market conditions, risk of fraud, or any other factors we deem relevant.

Additionally, spam-like behavior, including but not limited to mass distribution of tokens to random addresses will result in the asset being flagged as spam and possible removal from the repository.

name: CI

# Controls when the workflow will run
on:
  # Triggers the workflow on push or pull request events but only for the "main" branch
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v3

      # Runs a single command using the runners shell
      - name: Run a one-line script
        run: echo Hello, world!

      # Runs a set of commands using the runners shell
      - name: Run a multi-line script
        run: |
          echo Add other actions to build,
          echo test, and deploy your project.
