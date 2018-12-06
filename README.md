# GitHub Actions for yarn

This Action for [yarn](https://www.yarnpkg.com/) enables arbitrary actions with the `yarn` command-line client, including testing packages and publishing to a registry.

## Usage

An example workflow to build, test, and publish an npm package to the default public registry follows:

```hcl
workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "4Catalyzer/action-yarn@master"
  args = "install"
}

action "Test" {
  needs = "Build"
  uses = "4Catalyzer/action-yarn@master"
  args = "test"
}
```

### Secrets

- `NPM_AUTH_TOKEN` - **Optional**. The token to use for authentication with the npm registry. Required for `npm publish` ([more info](https://docs.npmjs.com/getting-started/working_with_tokens))

### Environment variables

- `NPM_REGISTRY_URL` - **Optional**. To specify a registry to authenticate with. Defaults to `registry.npmjs.org`
- `NPM_CONFIG_USERCONFIG` - **Optional**. To specify a non-default per-user configuration file. Defaults to `$HOME/.npmrc` ([more info](https://docs.npmjs.com/misc/config#npmrc-files))

#### Example

To authenticate with, and publish to, a registry other than `registry.npmjs.org`:

```hcl
action "Publish" {
  uses = "4Catalyzer/action-yarn@master"
  args = "publish --access public"
  env = {
    NPM_REGISTRY_URL = "someOtherRegistry.someDomain.net"
  }
  secrets = ["NPM_AUTH_TOKEN"]
}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See [THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
