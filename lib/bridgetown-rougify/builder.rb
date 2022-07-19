# frozen_string_literal: true

module BridgetownRougify
  class Builder < Bridgetown::Builder
    Bridgetown::Hooks.register_one :site, :after_init do |site|
      theme_name = site.config.dig(:rougify, :theme) || "base16"
      theme = Rouge::Theme.find(theme_name)
      if theme
        File.open(site.in_root_dir("frontend", "styles", "syntax-highlighting.css"), "w") do |f|
          css = theme.render(scope: ".highlight")
          f.write(css)
        end
      else
        Bridgetown.logger.warn("Rouge theme not found for #{theme_name}")
      end
    end
  end
end
