# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class CardGrouping < Component
    # @description
    # - Used to initialize a new Card Group.
    #
    # @param [Class] template
    # @param [Hash]  opts
    # @return [Card]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id      = opts.fetch(:id,    '')
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  nil)
      @content = block || proc { '' }
    end

    # @description
    # - Builds a `Card` for the grouping class.
    #
    # @param [Hash] opts
    # @return [Card]
    #
    def card(opts = {}, &block)
      Card.new(@template, opts, &block)
    end
  end
end
