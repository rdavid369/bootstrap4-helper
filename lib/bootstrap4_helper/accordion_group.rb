# @root
#
#
module Bootstrap4Helper
  # @description
  # - Used to build groups of Accordions, that are all synced with each other.
  #
  class AccordionGroup < Component
    # @description
    # -
    #
    # @param [ActionView] template
    # @param [NilClass|String|Symbol|Hash] context_or_options
    # @param [Hash]
    #
    def initialize(template, context_or_options = nil, opts = {}, &block)
      super(template)

      @context, args = parse_arguments(context_or_options, opts)

      @id      = args.fetch(:id,      uuid)
      @class   = args.fetch(:class,   '')
      @data    = args.fetch(:data,    {})
      @content = block || proc { '' }
    end

    # @description
    # - Used to build a `Accordion` for the `AccordionGroup`.
    #
    # @param [Mixed] args
    # @return [Accordion]
    #
    def accordion(*args, &block)
      opts = *args

      if opts.any? { |opt| opt.is_a?(Hash) }
        opts.collect! { |opt| opt[:parent] = @id if opt.is_a?(Hash) }
      else
        opts << { parent: @id }
      end

      Accordion.new(self, *opts, &block)
    end

    # @description
    # - Used to get the HTML markup of the `AccordionGroup`
    #
    # @return [String]
    #
    def to_s
      content_tag :div, id: @id, class: "accordion #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end