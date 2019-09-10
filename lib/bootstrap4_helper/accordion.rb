# @root
#
#
module Bootstrap4Helper
  # @description
  # - Builds a Accordion out of the collapse component of Bootstrap 4.
  #
  class Accordion < Component
    CARD_METHODS = %i[
      title
      text
      image_overlay
    ].freeze

    # @description
    # -
    #
    # @param [ActionView] template
    #
    def initialize(template, context_or_options = nil, opts = {}, &block)
      super(template)

      @context, args = parse_arguments(context_or_options, opts)

      @id      = args.fetch(:id,      uuid)
      @class   = args.fetch(:class,   '')
      @data    = args.fetch(:data,    {})
      @parent  = args.fetch(:parent,  nil)
      @target  = @data.fetch(:target, uuid)
      @content = block || proc { '' }
      @card    = Card.new(@template)
    end

    # @description
    # -
    #
    def header(*args, &block)
      @card.header(*args) do
        content_tag :h5 do
          content_tag(
            :a,
            data:  { toggle: 'collapse', target: "##{@target}" },
            &block
          )
        end
      end
    end

    # @description
    # -
    #
    def body(*args, &block)
      data = { parent: "##{@parent}" } if @parent.present?

      content_tag :div, id: @target, class: 'collapse', data: data do
        @card.body(*args, &block)
      end
    end

    # @description
    # -
    #
    def method_missing(method, *args, &block)
      if CARD_METHODS.include?(method)
        @card.send(method, *args, &block)
      else
        super
      end
    end

    # @description
    # - Leaving off the the default `accordion` class because with only 1 accordion,
    # there is no bottom.
    #
    # @return [String]
    #
    def to_s
      content_tag :div, class: "card #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end
