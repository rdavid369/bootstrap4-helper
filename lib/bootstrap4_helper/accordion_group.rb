#
#
#
module Bootstrap4Helper
  #
  #
  #
  class AccordionGroup < Component
    #
    #
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
    # -
    #
    def accordion(*args, &block)
      opts = *args
      opts << { parent: @id }

      Accordion.new(self, *opts, &block)
    end

    # @description
    # -
    #
    def to_s
      content_tag :div, id: @id, class: "accordion #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end