# @root
#
#
module Bootstrap4Helper
  #
  #
  #
  class Tab
    #
    #
    #
    class Content < Component
      # @description
      # -
      #
      # @param [ActionView] template
      # @param [NilClass|String|Symbol|Hash] context_or_options
      # @param [Hash]
      #
      def initialize(template, opts = {}, &block)
        super(template)

        @id      = opts.fetch(:id,    uuid)
        @class   = opts.fetch(:class, '')
        @data    = opts.fetch(:data,  {})
        @content = block || proc { '' }
      end

      # @description
      # -
      #
      def pane(source, opts = {}, &block)
        id    = opts.fetch(:id,    nil)
        klass = opts.fetch(:class, '')
        data  = opts.fetch(:data,  {})

        content_tag :div, id: source, class: "tab-pane #{klass}", role: 'tabpanel', &block
      end

      # @description
      # -
      #
      def to_s
        content_tag :div, id: @id, class: "tab-content #{@class}" do
          @content.call(self)
        end
      end
    end
  end
end
