# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class Badge < Component
    # @description
    # -
    #
    # @params [Hash] args
    # @return [ClassName]
    #
    def initialize(template, context_or_options = nil, opts = {}, &block)
      super(template)
      @context, args = parse_arguments(context_or_options, opts)

      @id      = args.fetch(:id, nil)
      @class   = args.fetch(:class, '')
      @content = block || proc { '' }
    end

    # @description
    # -
    #
    def to_s
      content_tag(:span, id: @id, class: container_class) { @content.call }
    end

    private

    # @description
    # - Used to get the container classes.
    #
    # @return [String]
    #
    def container_class
      string = 'badge '
      string += @context == 'secondary' ? 'alert-secondary' : "alert-#{@context}"
      string += " #{@class}"
      string
    end
  end
end
