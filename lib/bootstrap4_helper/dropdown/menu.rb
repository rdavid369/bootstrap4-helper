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
      def item(target, opts = {}, &block)
        id    = opts.fetch(:id,    nil)
        klass = opts.fetch(:class, '')
        data  = opts.fetch(:data,  {})
        aria  = opts.fetch(:aria,  {})

        content_tag(
          :a,
          class: "dropdown-item #{klass}",
          href:  "##{target}",
          aria:  aria,
          data:  { toggle: 'tab' }
        ) do
          block ? block.call : target.to_s.titleize
        end
      end

      # @description
      # -
      #
      def text(text = nil, opts = {}, &block)
        id    = opts.fetch(:id,    nil)
        klass = opts.fetch(:class, '')
        data  = opts.fetch(:data,  {})

        content_tag(
          :span,
          id:     id,
          class: "dropdown-item-text #{klass}",
          data:  data
        ) do
          text ? text : block.call
        end
      end

      # @description
      # -
      #
      def header(text, opts = {}, &block)
        id    = opts.fetch(:id,    nil)
        klass = opts.fetch(:class, '')
        data  = opts.fetch(:data,  {})

        content_tag(
          :h6,
          id:     id,
          class: "dropdown-header #{klass}",
          data:  data
        ) do
          text ? text : block.call
        end
      end

      # @description
      # -
      #
      def divider
        content_tag :div, "", class: "dropdown-divider"
      end

      # @description
      # -
      #
      def to_s
        content_tag :div, id: @id, class: "dropdown-menu #{@class}", data: @data do
          @content.call(self)
        end
      end
    end
  end
end
