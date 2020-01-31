module Bootstrap4Helper
  # Builds a Nav Component that can be used in other components.
  #
  #
  class Nav < Component
    # Class constructor
    #
    # @param [ActionView]     template
    # @param [Hash]           opts
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    # @option opts [Hash]    :child
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

    # rubocop:disable Metrics/MethodLength

    # Adds an nav-item to the nav component. this method gets used when the nav-item
    # links to content in a tab or something.
    #
    # @param [Symbol|String] target
    # @param [Hash] opts
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    # @option opts [Hash]    :aria
    # @return [String]
    #
    def item(target, opts = {})
      id    = opts.fetch(:id,    nil)
      klass = opts.fetch(:class, '')
      data  = opts.fetch(:data,  {})
      aria  = opts.fetch(:aria,  {})

      content_tag :li, id: id, class: 'nav-item', data: data do
        content_tag(
          :a,
          class:    "nav-link #{klass}",
          href:     "##{target}",
          tabindex: -1,
          data:     @child[:data],
          aria:     aria
        ) do
          block_given? ? yield : target.to_s.titleize
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    # Use this when the nav item is nothing more than a hyperlink.
    #
    # @param [String|NilClass] name
    # @param [Hash|NilClass]   options
    # @param [Hash|NilClass]   html_options
    # @return [String]
    #
    def link(name = nil, options = nil, html_options = nil, &block)
      html_options = (html_options || {}).merge(class: 'nav-link')

      @template.link_to(name, options, html_options, &block)
    end

    # Creates a dropdown menu for the nav.
    #
    # @param [NilClass|Symbol|String] name
    # @param [Hash] opts
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    # @option opts [Hash]    :aria
    # @return [String]
    #
    def dropdown(name, opts = {}, &block)
      id    = opts.fetch(:id,    nil)
      klass = opts.fetch(:class, '')
      data  = opts.fetch(:data,  {})
      aria  = opts.fetch(:aria,  {}).merge(haspopup: true, expanded: false)

      content_tag :li, id: id, class: 'nav-item dropdown', data: data do
        content_tag(
          :a,
          name,
          class: "nav-link dropdown-toggle #{klass}",
          href:  '#',
          data:  { toggle: 'dropdown' },
          role:  'button',
          aria:  aria
        ) + @dropdown.menu(opts, &block).to_s.html_safe
      end
    end

    # String representation of the object.
    #
    # @return [String]
    #
    def to_s
      content_tag :ul, id: @id, class: "nav #{@class}" do
        @content.call(self)
      end
    end
  end
end
