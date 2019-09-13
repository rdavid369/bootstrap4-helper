# @root
#
#
module Bootstrap4Helper
  # @description
  # - Used to build Bootstrap Card components.  Cards are wildly used through Bootstrap 4.
  #
  class Card < Component
    # @description
    # - Used to initialize a new Card component.
    #
    # @param [ActionView] template
    # @param [Hash]  opts
    # @return [Card]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id      = opts.fetch(:id,    '')
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  nil)
      @content = block || proc { '' }
    end

    # @description
    # - Builds the Header component.
    #
    # @param [Hash] args
    # @return [String]
    #
    def header(args = {}, &block)
      build_base_component :header, args, &block
    end

    # @description
    # - Builds the Body component.
    #
    # @param [Hash] args
    # @return [String]
    #
    def body(args = {}, &block)
      build_base_component :body, args, &block
    end

    # @description
    # - Builds the Footer component.
    #
    # @param [Hash] args
    # @return [String]
    #
    def footer(args = {}, &block)
      build_base_component :footer, args, &block
    end

    # @description
    # - Builds a Title component.
    #
    # @param [Hash] args
    # @return [String]
    #
    def title(args = {}, &block)
      build_sub_component :h5, :title, args, &block
    end

    # @description
    # - Builds a Text component.
    #
    # @param [Hash] args
    # @return [String]
    #
    def text(args = {}, &block)
      build_sub_component :p, :text, args, &block
    end

    # @description
    # - Builds a Img Overlay component.
    #
    # @param [Hash] args
    # @return [String]
    #
    def image_overlay(args = {}, &block)
      build_base_component 'img-overlay', args, &block
    end

    # @description
    # - Outputs the Object in its String representation.
    #
    def to_s
      content_tag :div, id: @id, class: "card #{@class}", data: @data do
        @content.call(self)
      end
    end

    private

    # @description
    # - Used to build basic DIV components.
    #
    # @param [String] type
    # @param [Mixed] args
    # @return [String]
    #
    def build_base_component(type, args, &block)
      build_sub_component :div, type, args, &block
    end

    # @description
    # - Used to build various DOM components.
    #
    # @param [Symbol] tag
    # @param [String] type
    # @param [Mixed] args
    # @return [String]
    #
    def build_sub_component(tag, type, args, &block)
      id    = args.fetch(:id,    '')
      klass = args.fetch(:class, '')
      data  = args.fetch(:data,  {})

      content_tag(
        tag,
        id:    id,
        class: "card-#{type} #{klass}",
        data:  data,
        &block
      )
    end
  end
end
