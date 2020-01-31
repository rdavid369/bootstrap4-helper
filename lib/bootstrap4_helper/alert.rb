module Bootstrap4Helper
  # The Alert helper is meant to help you rapidly build Bootstrap Alert
  # components quickly and easily. The dissmiss button is optional.
  #
  class Alert < Component
    # Class constructor
    #
    # @param [Class] template - Template in which your are binding too.
    # @param [NilClass|String|Symbol|Hash] context_or_options
    # @param [Hash]  opts
    # @return [Alert]
    #
    def initialize(template, context_or_options = nil, opts = {}, &block)
      super(template)
      @context, args = parse_arguments(context_or_options, opts)

      @id          = args.fetch(:id,          nil)
      @class       = args.fetch(:class,       '')
      @dismissible = args.fetch(:dismissible, false)
      @content     = block || proc { '' }
    end

    # The dissmiss button, if the element has one.
    #
    # @return [String]
    #
    def close_button
      content_tag(:button, class: 'close', data: { dismiss: 'alert' }, aria: { label: 'Close' }) do
        content_tag(:span, aria: { hidden: true }) { '&times;'.html_safe }
      end
    end

    # Used to render out the Alert component.
    #
    # @return [String]
    #
    def to_s
      content_tag :div, id: @id, class: container_class do
        concat(@dismissible ? close_button : '')
        @content.call(self)
      end
    end

    private

    # Used to get the container classes.
    #
    # @return [String]
    #
    def container_class
      "alert alert-#{@context} #{@class}"
    end
  end
end
