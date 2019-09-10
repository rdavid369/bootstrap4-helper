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
    # @param [NilClass|String|Symbol|Hash] - Bootstrap class context, or options hash.
    # @param [Hash]  opts
    # @return [Card]
    #
    def initialize(template, context_or_options = nil, opts = {}, &block)
      super(template)

      @context, args = parse_arguments(context_or_options, opts)

      @id      = args.fetch(:id,    '')
      @class   = args.fetch(:class, '')
      @data    = args.fetch(:data,  nil)
      @content = block || proc { '' }
    end

    # @description
    # -
    #
    def card(context_or_options = nil, opts = {}, &block)
      Card.new(@template, context_or_options, opts, &block)
    end
  end
end
