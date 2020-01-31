module Bootstrap4Helper
  # Creates Bootstrap badge components that can be used anywhere.
  #
  #
  class Badge < Component
    # Class constructor
    #
    # @param [ActionView] template
    # @param [NilClass|String|Symbol|Hash] context_or_options
    # @param [Hash] opts
    #
    def initialize(template, context_or_options = nil, opts = {}, &block)
      super(template)
      @context, args = parse_arguments(context_or_options, opts)

      @id      = args.fetch(:id,    nil)
      @class   = args.fetch(:class, '')
      @content = block || proc { '' }
    end

    # String representation of the object.
    #
    #
    def to_s
      content_tag(config(:badge, :span), id: @id, class: container_class) { @content.call(self) }
    end

    private

    # Used to get the container classes.
    #
    # @return [String]
    #
    def container_class
      string = 'badge '
      string += @context == 'secondary' ? 'badge-secondary' : "badge-#{@context}"
      string += " #{@class}"
      string
    end
  end
end
