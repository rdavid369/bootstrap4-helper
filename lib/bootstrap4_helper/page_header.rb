module Bootstrap4Helper
  # Builds a simple CSS spinner component.
  #
  #
  class PageHeader < Component
    # Class constructor
    #
    # @param [ActionView] template
    # @param [Hash] opts
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    #
    def initialize(template, opts = {}, &block)
      super(template)

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
        config(:page_header, :h1),
        id:    @id,
        class: "pb-2 mt-4 mb-2 border-bottom #{@class}",
        data:  @data
      ) do
        @content.call(self)
      end
    end
  end
end
