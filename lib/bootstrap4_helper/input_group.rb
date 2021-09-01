module Bootstrap4Helper
  # The InputGroup helper is meant to help you rapidly build Bootstrap input
  # group components quickly and easily.
  #
  class InputGroup < Component
    VALID_TYPES = %i[append prepend].freeze

    # Class constructor
    #
    # @param  [Class] template - Template in which your are binding too.
    # @param  [Symbol] type - Whether the component is prepend or append.
    # @param  [Hash]  opts
    # @return [InputGroup]
    #
    def initialize(template, type = :prepend, opts = {}, &block)
      super(template)

      @type    = VALID_TYPES.include?(type) ? type : :prepend
      @id      = opts.fetch(:id,          nil)
      @class   = opts.fetch(:class,       '')
      @data    = opts.fetch(:data,        {})
      @content = block || proc { '' }
    end

    # This is the element that actually houses the icon or text used
    # in the input group.
    #
    # @param  [Hash] opts
    # @return [String]
    #
    def text(opts = {}, &block)
      opts[:class] = (opts[:class] || '') << " input-group-#{@type}"

      content_tag :div, opts do
        content_tag :span, class: 'input-group-text', &block
      end
    end

    # Used to render out the InputGroup component.
    #
    # @return [String]
    #
    def to_s
      content_tag(
        :div,
        id:    @id,
        class: "input-group #{@class}",
        data:  @data
      ) do
        @content.call(self)
      end
    end
  end
end
