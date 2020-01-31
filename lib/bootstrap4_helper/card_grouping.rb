module Bootstrap4Helper
  # Class for other Card group type components to inherit from.
  #
  #
  class CardGrouping < Component
    # Used to initialize a new Card Grouping.
    #
    # @param [Class] template
    # @param [Hash]  opts
    # @option opts [String] :id
    # @option opts [String] :class
    # @option opts [Hash]   :data
    # @return [Card]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id      = opts.fetch(:id,    '')
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  nil)
      @content = block || proc { '' }
    end

    # Builds a `Card` for the grouping class.
    #
    # @param [Hash] opts
    # @return [Card]
    #
    def card(opts = {}, &block)
      Card.new(@template, opts, &block)
    end
  end
end
