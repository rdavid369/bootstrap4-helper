module Bootstrap4Helper
  # Builds a simple CSS spinner component.
  #
  #
  class Spinner < Component
    # Class constructor
    #
    # @note The different support types are: `:border` and `:grow`
    #
    # @param [ActionView] template
    # @param [Hash] opts
    # @option opts [Symbol]  :type
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @type    = opts.fetch(:type, :border)
      @id      = opts.fetch(:id,    uuid)
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  {})
      @content = block || proc { '' }
    end

    # String representation of the object.
    #
    # @return [String]
    #
    def to_s
      content_tag(
        :span,
        id:    @id,
        class: "spinner-#{@type} #{@class}",
        role:  'status',
        aria:  { hidden: true },
        data:  @data
      ) do
        content_tag :span, 'Loading', class: 'sr-only'
      end
    end
  end
end
