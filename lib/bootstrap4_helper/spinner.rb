# @root
#
#
module Bootstrap4Helper
  # @description
  # - a simple CSS spinner component.
  #
  class Spinner < Component
    # @description
    # -
    #
    # @param [ActionView] template
    # @param [Hash] opts
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @type    = opts.fetch(:type, :border)
      @id      = opts.fetch(:id,    uuid)
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  {})
      @content = block || proc { '' }
    end

    # @description
    # -
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
