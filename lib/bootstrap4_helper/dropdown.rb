# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class Dropdown < Component
    # @description
    # -
    #
    # @param [ActionView] template
    # @param [Symbol|String] type
    # @param [Hash] opts
    # @param [Hash]
    #
    def initialize(template, type = :dropdown, opts = {}, &block)
      super(template)

      @type    = type
      @id      = opts.fetch(:id,    uuid)
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  {})
      @content = block || proc { '' }
    end

    # @description
    # - Used to generate a button for the dropdown.  The buttons default as just
    # a button that opens the coresponding dropdown menu.  The `split: true` option
    # make the button just the arrow indicator that open the menu.
    #
    # @param [Symbol] context
    # @param [Hash] opts
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

    # @description
    # - Used to create a new `Dropdown::Menu`
    #
    # @param [Hash] opts
    # @return [Dropdown::Menu]
    #
    def menu(opts = {}, &block)
      Menu.new(@template, opts, &block)
    end

    # @description
    # -
    #
    def to_s
      content_tag :div, id: @id, class: "#{container_class} #{@class}", data: @data do
        @content.call(self)
      end
    end

    private

    # @description
    # - Returns the container class for the dropdown component.
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
