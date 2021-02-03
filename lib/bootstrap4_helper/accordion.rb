module Bootstrap4Helper
  # Builds a Accordion out of the collapse component of Bootstrap 4.
  #
  #
  class Accordion < Component
    CARD_METHODS = %i[
      title
      text
      image_overlay
      footer
    ].freeze

    # Class constructor
    #
    # @param [ActionView] template
    # @param [Hash] opts
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    # @option opts [String]  :parent
    # @option opts [String]  :target
    # @option opts [Boolean] :expanded
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id       = opts.fetch(:id,       uuid)
      @class    = opts.fetch(:class,    '')
      @data     = opts.fetch(:data,     {})
      @parent   = opts.fetch(:parent,   nil)
      @expanded = opts.fetch(:expanded, false)
      @target   = @data.fetch(:target,  uuid)
      @content  = block || proc { '' }
      @card     = Card.new(@template)
    end

    # Builds a header component for the accordion, which is actually the header
    # of a Card.
    #
    # @param  [Hash] opts
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

    # Builds the body component for the accordion, which is actually the body
    # of a Card.
    #
    # @note The `@parent` gets used to set the parent element for the accordion. This
    #   gets used primarily in the `AccordionGroup`.
    #
    # @param  [Hash] opts
    # @return [String]
    #
    def body(opts = {}, &block)
      data  = { parent: "##{@parent}" } if @parent.present?
      klass = 'collapse'
      klass += ' show' if @expanded

      content_tag :div, id: @target, class: klass, data: data do
        @card.body(opts, &block)
      end
    end

    # Because Accordions are basically `Cards` with a wrapper, we might as
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

    # Checks if the Object reponds to missing.
    #
    #
    def respond_to_missing?(method, include_private = false)
      CARD_METHODS.include?(method) || super
    end

    # Leaving off the default `accordion` class because with only 1 accordion,
    # there is no bottom.
    #
    # @return [String]
    #
    def to_s
      content_tag :div, id: @id, class: "card #{@class}", data: @data.except(:target) do
        @content.call(self)
      end
    end
  end
end
