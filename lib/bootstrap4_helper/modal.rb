# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class Modal < Component
    # @description
    # -
    #
    # @param [ActionView] template
    # @param [Hash]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id         = opts.fetch(:id,         uuid)
      @class      = opts.fetch(:class,      '')
      @data       = opts.fetch(:data,       {})
      @scrollable = opts.fetch(:scrollable, false)
      @vcentered  = opts.fetch(:vcentered,  false)
      @content    = block || proc { '' }
    end

    # @description
    # - Build the header component for the modal.
    #
    # @param [Hash] opts
    #
    def header(opts = {}, &block)
      build_main_component :header, opts, &block
    end

    # @description
    # - Builds the body component.
    #
    # @param [Hash] opts
    #
    def body(opts = {}, &block)
      build_main_component :body, opts, &block
    end

    # @description
    # - Builds the footer component.
    #
    # @param [Hash] opts
    #
    def footer(opts = {}, &block)
      build_main_component :footer, opts, &block
    end

    # @description
    # - Builds a title component.
    #
    # @param [Hash] opts
    #
    def title(opts = {}, &block)
      build_sub_component :h5, :title, opts, &block
    end

    # @description
    # - Builds a close button component.
    #
    # @param [Hash] opts
    #
    def close_button(opts = {})
      klass = opts.fetch(:class, '')

      content_tag(
        :button,
        type:  'button',
        class: block_given? ? klass : 'close',
        data:  { dismiss: 'modal' },
        aria:  { label: 'Close' }
      ) do
        block_given? ? yield : xbutton
      end
    end

    # @description
    # -
    #
    def to_s
      content_tag :div, id: @id, class: "modal #{@class}", tabindex: -1, role: 'dialog', data: @data do
        content_tag :div, class: "modal-dialog #{scrollable} #{vcentered}", role: 'document' do
          content_tag(:div, class: 'modal-content') { @content.call(self) }
        end
      end
    end

    private

    # @description
    # - Used to build main components, usually divs.
    #
    # @param [Symbol|String] type
    # @param [Hash] opts
    #
    def build_main_component(type, opts = {}, &block)
      build_sub_component :div, type, opts, &block
    end

    # @description
    # - Used to build more specific components.
    #
    # @param [Symbol] tag
    # @param [Symbol|String] type
    # @param [Hash] opts
    #
    def build_sub_component(tag, type, opts = {}, &block)
      id    = opts.fetch(:id,    nil)
      klass = opts.fetch(:class, '')
      data  = opts.fetch(:data,  {})

      content_tag(
        tag,
        id:    id,
        class: "modal-#{type} #{klass}",
        data:  data,
        &block
      )
    end

    # @description
    # - Builds the `x` button normally used in the header.
    #
    def xbutton
      content_tag :span, '&times;'.html_safe, aria: { hidden: true }
    end

    # @description
    # - Gets the scrollable CSS class.
    #
    # @return [String]
    #
    def scrollable
      @scrollable ? 'modal-dialog-scrollable' : ''
    end

    # @description
    # - Gets the vertical-center CSS class.
    #
    # @return [String]
    #
    def vcentered
      @vcentered ? 'modal-dialog-centered' : ''
    end
  end
end
