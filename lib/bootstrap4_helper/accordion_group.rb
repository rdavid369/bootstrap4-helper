module Bootstrap4Helper
  # Used to build groups of Accordions, that are all synced with each other.
  #
  #
  class AccordionGroup < Component
    # Class constructor
    #
    # @param [ActionView] template
    # @param [Hash] opts
    # @option opts [String] :id
    # @option opts [String] :class
    # @option opts [Hash]   :data
    # @param [Hash]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id      = opts.fetch(:id,      uuid)
      @class   = opts.fetch(:class,   '')
      @data    = opts.fetch(:data,    {})
      @content = block || proc { '' }
    end

    # Used to build a `Accordion` for the `AccordionGroup`.
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

    # Used to get the HTML markup of the `AccordionGroup`
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
