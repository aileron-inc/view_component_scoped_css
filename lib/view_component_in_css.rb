# frozen_string_literal: true

require_relative "view_component_in_css/version"
require "active_support"
require "sass-embedded"

#
# Provide a style for each view component that can be handled as css in js.
#
module ViewComponentInCss
  class Error < StandardError; end
  # Your code goes here...

  extend ActiveSupport::Autoload
  autoload :Loader
  autoload :CurrentContext
  autoload :Tag
  autoload :Hook
  autoload :Css
  autoload :Config

  def self.configure
    yield config
  end

  def self.config
    @config ||= Config.new
  end
end
