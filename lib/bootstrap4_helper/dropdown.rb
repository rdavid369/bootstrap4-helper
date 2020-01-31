module Bootstrap4Helper
  # Builds a Dropdown component that can be used in other components.
  #
  #
  class Dropdown < Component
    # Class constructor
    #
    # @param [ActionView]    template
    # @param [Symbol|String] type
    # @param [Hash]          opts
    # @option opts [String] :id
    # @option opts [String] :class
    # @option opts [Hash]   :data
    #
    def initialize(template, type = :dropdown, opts = {}, &block)
      super(template)

      @type    = type
      @id      = opts.fetch(:id,    uuid)
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  {})
      @content = block || proc { '' }
    end

    # Used to generate a button for the dropdown.  The buttons default as just
    # a button that opens the coresponding dropdown menu.  The `split: true` option
    # make the button just the arrow indicator that open the menu.
    #
    # @param  [Symbol] context
    # @param  [Hash]   opts
    # @option opts [Boolean] :split
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    # @return [String]
    #
    def button(context = :primary, opts = {})
      split = opts.fetch(:split, false)
      id    = opts.fetch(:id,    nil)
      klass = opts.fetch(:class, '')
      data  = opts.fetch(:data,  {}).merge(toggle: 'dropdown')
      extra = split ? 'dropdown-toggle-split' : ''

      content_tag(
        :button,
        id:    id,
        type:  'button',
        class: "dropdown-toggle btn btn-#{context} #{klass} #{extra}",
        data:  data,
        aria:  { haspopup: true, expanded: false }
      ) do
        split ? content_tag(:span, 'Toggle Dropdwon', class: 'sr-only') : yield
      end
    end

    # Used to create a new `Dropdown::Menu`
    #
    # @param  [Hash] opts
    # @option opts [String] :id
    # @option opts [String] :class
    # @option opts [Hash]   :data
    # @return [Dropdown::Menu]
    #
    def menu(opts = {}, &block)
      Menu.new(@template, opts, &block)
    end

    # String reprentation of the object.
    #
    # @return [String]
    #
    def to_s
      content_tag :div, id: @id, class: "#{container_class} #{@class}", data: @data do
        @content.call(self)
      end
    end

    private

    # Returns the container class for the dropdown component.
    #
    # @return [String]
    #
    def container_class
      case @type
      when :dropdown
        'dropdown'
      when :group
        'btn-group'
      else
        ''
      end
    end
  end
end
