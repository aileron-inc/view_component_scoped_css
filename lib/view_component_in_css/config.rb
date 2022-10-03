# frozen_string_literal: true

module ViewComponentInCss
  #
  # ViewComponentInCss config
  #
  class Config
    include ActiveSupport::Configurable
    config_accessor(:component_tag) { :div }
  end
end
