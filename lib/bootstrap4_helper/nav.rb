# @root
#
#
module Bootstrap4Helper
  # @description
  # -
  #
  class Nav < Component
    # @description
    # -
    #
    # @param [ActionView] template
    # @param [NilClass|String|Symbol|Hash] context_or_options
    # @param [Hash]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id       = opts.fetch(:id,    uuid)
      @class    = opts.fetch(:class, '')
      @data     = opts.fetch(:data,  {})
      @child    = opts.fetch(:child, {})
      @content  = block || proc { '' }

      @dropdown = Dropdown.new(@template)
    end

    # @description
    # -
    #
    def item(target, opts = {}, &block)
      id    = opts.fetch(:id,    nil)
      klass = opts.fetch(:class, '')
      data  = opts.fetch(:data,  {})
      aria  = opts.fetch(:aria,  {})

      content_tag :li, id: id, class: "nav-item", data: data do
        content_tag(
          :a,
          class:    "nav-link #{klass}",
          href:     "##{target}",
          tabindex: -1,
          data:     @child[:data],
          aria:     aria
        ) do
          block ? block.call : target.to_s.titleize
        end
      end
    end

    # @description
    # -
    #
    def dropdown(name, opts = {}, &block)
      id    = opts.fetch(:id,    nil)
      klass = opts.fetch(:class, '')
      data  = opts.fetch(:data,  {})
      aria  = opts.fetch(:aria,  {})

      content_tag :li, id: id, class: "nav-item dropdown", data: data do
        content_tag(
          :a,
          name,
          class: "nav-link dropdown-toggle #{klass}",
          href:  '#',
          data:  { toggle: 'dropdown'},
          role:  'button',
          aria:  { haspopup: true, expanded: false }
        ) + @dropdown.menu(opts, &block).to_s.html_safe
      end
    end

    # @description
    # -
    #
    def to_s
      content_tag :ul, id: @id, class: "nav #{@class}" do
        @content.call(self)
      end
    end
  end
end
