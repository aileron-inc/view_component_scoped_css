# frozen_string_literal: true

module ViewComponentInCss
  #
  # A class for providing styles to a view component.
  # If you include this class, you will be able to describe scss in the namespace of each component
  #
  module Base
    extend ActiveSupport::Concern

    included do
      include ViewComponentInCss::Hook
    end

    class_methods do
      def component_identifier
        @component_identifier ||= name.sub("::Component", "").underscore.split("/").join("::")
      end

      def to_css
        @to_css ||= raw(
          ViewComponentInCss::Loader.new(self).call
        )
      end
    end

    def component_tag(tag = ViewComponentInCss.config.component_tag, **opts, &block)
      opts[:class] ||= :component
      content_tag(
        tag,
        class: ["viewcomponent", self.class.component_identifier, opts[:class]].compact.join("::"),
        style: opts[:style],
        &block
      )
    end
  end
end
