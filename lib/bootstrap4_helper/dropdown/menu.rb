# @root
#
#
module Bootstrap4Helper
  class Dropdown
    # @description
    #
    #
    class Menu < Component
      # @description
      # -
      #
      # @param [ActionView] template
      # @param [Hash] opts
      # @param [Hash]
      #
      def initialize(template, opts = {}, &block)
        super(template)

        @id      = opts.fetch(:id,    uuid)
        @class   = opts.fetch(:class, '')
        @data    = opts.fetch(:data,  {})
        @content = block || proc { '' }
      end

      # @description
      # - Use this method when the `item`, `link` in the item in the menu  is nothing
      # more than a hyperlink.
      #
      def link(name = nil, options = nil, html_options = nil, &block)
        html_options = (html_options || {}).merge(class: 'dropdown-item')

        @template.link_to(name, options, html_options, &block)
      end

      # @description
      # - Use this method when you are using the item in the menu as trigger for tab
      # content.
      #
      # @param [Symbol|String] target
      # @param [Hash] opts
      #
      def item(target, opts = {})
        id    = opts.fetch(:id,    nil)
        klass = opts.fetch(:class, '')
        data  = opts.fetch(:data,  {}).merge(toggle: 'tab')
        aria  = opts.fetch(:aria,  {})

        content_tag(
          :a,
          id:    id,
          class: "dropdown-item #{klass}",
          href:  "##{target}",
          aria:  aria,
          data:  data
        ) do
          block_given? ? yield : target.to_s.titleize
        end
      end

      # @description
      # - Builds a Text component
      #
      # @param [Symbol|String] text
      # @param [Hash] opts
      #
      def text(text, opts = {}, &block)
        build_sub_component :span, text, 'item-text', opts, &block
      end

      # @description
      # - Builds a Header component
      #
      # @param [Symbol|String] text
      # @param [Hash] opts
      #
      def header(text, opts = {}, &block)
        build_sub_component :h6, text, 'header', opts, &block
      end

      # @description
      # - Builds a divider element
      #
      def divider
        content_tag :div, '', class: 'dropdown-divider'
      end

      # @description
      # -
      #
      def to_s
        content_tag :div, id: @id, class: "dropdown-menu #{@class}", data: @data do
          @content.call(self)
        end
      end

      private

      # @description
      # - Used to build specific components.
      #
      # @param [Symbol] tag
      # @param [Symbol|String] text
      # @param [Symbol|String] type
      # @param [Hash] opts
      #
      def build_sub_component(tag, text, type, opts)
        id    = opts.fetch(:id,    nil)
        klass = opts.fetch(:class, '')
        data  = opts.fetch(:data,  {})

        content_tag(
          tag,
          id:    id,
          class: "dropdown-#{type} #{klass}",
          data:  data
        ) do
          block_given? ? yield : text || ''
        end
      end
    end
  end
end
