# Bridgetown Rougify Plugin

Configure the [Rouge](https://github.com/rouge-ruby/rouge) syntax highlighting theme you want to use in your markdown
code blocks in Bridgetown

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-rougify -g bridgetown_plugins
```

### Configuration

Add the following section to your bridgetown.config.yml:

```yaml
rougify:
  theme: 'github'
```

Otherwise the default theme will be `base16`. One place to preview possible
Rouge themes is [here](https://spsarolkar.github.io/rouge-theme-preview/).

## Testing

* Run `bundle exec rake test` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and Minitest together.


