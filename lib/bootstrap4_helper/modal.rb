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
    # @param [NilClass|String|Symbol|Hash] context_or_options
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
    # -
    #
    def header(opts = {}, &block)
      build_main_component :header, opts, &block
    end

    # @description
    # -
    #
    def body(opts = {}, &block)
      build_main_component :body, opts, &block
    end

    # @description
    # -
    #
    def footer(opts = {}, &block)
      build_main_component :footer, opts, &block
    end

    # @description
    # -
    #
    def title(opts = {}, &block)
      build_sub_component :h5, :title, opts, &block
    end

    # @description
    # -
    #
    def close_button(opts = {}, &block)
      klass = opts.fetch(:class, '')

      content_tag(
        :button,
        type:  'button',
        class: block ? klass : "close",
        data:  { dismiss: 'modal' },
        aria:  { label: 'Close' }
      ) do
        block ? block.call : xbutton
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
    # -
    #
    def build_main_component(type, opts = {}, &block)
      build_sub_component :div, type, opts, &block
    end

    # @description
    # -
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
    # -
    #
    def xbutton
      content_tag :span, '&times;'.html_safe, aria: { hidden: true }
    end

    # @description
    # -
    #
    def scrollable
      @scrollable ? 'modal-dialog-scrollable' : ''
    end

    # @description
    # -
    #
    def vcentered
      @vcentered ? 'modal-dialog-centered' : ''
    end
  end
end
