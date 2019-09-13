# @root
#
#
module Bootstrap4Helper
  # @description
  # - The Alert helper is meant to help you rapidly build Bootstrap Alert
  # components quickly and easily. The dissmiss button is optional.
  #
  #   <code>
  #     <%= alert_helper :warning, dismissable: true do %>
  #       <% if @model.errors.present? %>
  #         <p>Some kind of error</p>
  #       <% end %>
  #     <% end %>
  #
  #     <%= alert_helper(:success, dismissible: true) { "Successful save"}
  #   </code>
  #
  class Alert < Component
    # @description
    # - Used to generate Bootstrap alert components quickly.
    #
    # @param [Class] template - Template in which your are binding too.
    # @param [NilClass|String|Symbol|Hash] - Bootstrap class context, or options hash.
    # @param [Hash]  opts
    #   <code>
    #     opts = {
    #       id:     [String] - ID of the alert box
    #       class:  [String] - Additional classes for the alert box
    #     }
    #   </code>
    # @param [Proc] &block
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

    # @description
    # - The dissmiss button, if the element has one.
    #
    # @return [String]
    #
    def close_button
      content_tag(:button, class: 'close', data: { dismiss: 'alert' }, aria: { label: 'Close' }) do
        content_tag(:span, aria: { hidden: true }) { '&times;'.html_safe }
      end
    end

    # @description
    # - Used to render out the Alert component.
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

    # @description
    # - Used to get the container classes.
    #
    # @return [String]
    #
    def container_class
      "alert alert-#{@context} #{@class}"
    end
  end
end
