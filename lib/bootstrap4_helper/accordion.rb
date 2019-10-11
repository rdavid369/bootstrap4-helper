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
    # @param [Hash] opts
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id      = opts.fetch(:id,      uuid)
      @class   = opts.fetch(:class,   '')
      @data    = opts.fetch(:data,    {})
      @parent  = opts.fetch(:parent,  nil)
      @target  = @data.fetch(:target, uuid)
      @content = block || proc { '' }
      @card    = Card.new(@template)
    end

    # @description
    # - Builds a header component for the accordion, which is actually the header
    # of a Card.
    #
    # @param [Hash] opts
    # @return [String]
    #
    def header(opts = {}, &block)
      @card.header(opts) do
        content_tag(config(:accordion_header, :h5)) do
          content_tag(
            :a,
            data: { toggle: 'collapse', target: "##{@target}" },
            &block
          )
        end
      end
    end

    # @description
    # - Builds the body component for the accordion, which is actually the body
    # of a Card.
    #
    # @note
    # - The `@parent` gets used to set the parent element for the accordion. This
    # gets used primarily in the `AccordionGroup`.
    #
    # @param [Hash] opts
    # @return [String]
    #
    def body(opts = {}, &block)
      data = { parent: "##{@parent}" } if @parent.present?

      content_tag :div, id: @target, class: 'collapse', data: data do
        @card.body(opts, &block)
      end
    end

    # @description
    # - Because Accordions are basically `Cards` with a wrapper, we might as
    # well catch common `Card` methods and send them to the card object.  No
    # point in creating similar methods for `Accordions`.
    #
    # @param [Symbol|String] method
    # @param [Mixed] args
    #
    def method_missing(method, *args, &block)
      if CARD_METHODS.include?(method)
        @card.send(method, *args, &block)
      else
        super
      end
    end

    # @description
    # -
    #
    def respond_to_missing?(method, include_private = false)
      CARD_METHODS.include?(method) || super
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
