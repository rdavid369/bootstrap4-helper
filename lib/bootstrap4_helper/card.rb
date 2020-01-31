module Bootstrap4Helper
  # Used to build Bootstrap Card components.  Cards are wildly used through Bootstrap 4.
  #
  #
  class Card < Component
    # Used to initialize a new Card component.
    #
    # @param  [ActionView] template
    # @param  [Hash]  opts
    # @option opts [String] :id
    # @option opts [String] :class
    # @option opts [Hash]   :data
    # @return [Card]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @id      = opts.fetch(:id,    '')
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  nil)
      @content = block || proc { '' }
    end

    # Builds the Header component.
    #
    # @param  [Hash] args
    # @option args [String] :id
    # @option args [String] :class
    # @option args [Hash]   :data
    # @return [String]
    #
    def header(args = {}, &block)
      build_base_component :header, args, &block
    end

    # Builds the Body component.
    #
    # @param  [Hash] args
    # @option args [String] :id
    # @option args [String] :class
    # @option args [Hash]   :data
    # @return [String]
    #
    def body(args = {}, &block)
      build_base_component :body, args, &block
    end

    # Builds the Footer component.
    #
    # @param  [Hash] args
    # @option args [String] :id
    # @option args [String] :class
    # @option args [Hash]   :data
    # @return [String]
    #
    def footer(args = {}, &block)
      build_base_component :footer, args, &block
    end

    # Builds a Title component.
    #
    # @param  [Hash] args
    # @option args [String] :id
    # @option args [String] :class
    # @option args [Hash]   :data
    # @return [String]
    #
    def title(args = {}, &block)
      build_sub_component config(:card_title, :h5), :title, args, &block
    end

    # Builds a Text component.
    #
    # @param  [Hash] args
    # @option args [String] :id
    # @option args [String] :class
    # @option args [Hash]   :data
    # @return [String]
    #
    def text(args = {}, &block)
      build_sub_component config(:card_text, :p), :text, args, &block
    end

    # Builds a Img Overlay component.
    #
    # @param  [Hash] args
    # @option args [String] :id
    # @option args [String] :class
    # @option args [Hash]   :data
    # @return [String]
    #
    def image_overlay(args = {}, &block)
      build_base_component 'img-overlay', args, &block
    end

    # Outputs the Object in its String representation.
    #
    # @return [String]
    #
    def to_s
      content_tag :div, id: @id, class: "card #{@class}", data: @data do
        @content.call(self)
      end
    end

    private

    # Used to build basic DIV components.
    #
    # @param  [String] type
    # @param  [Mixed] args
    # @return [String]
    #
    def build_base_component(type, args, &block)
      build_sub_component :div, type, args, &block
    end

    # Used to build various DOM components.
    #
    # @param  [Symbol] tag
    # @param  [String] type
    # @param  [Hash]   args
    # @option args [String] :id
    # @option args [String] :class
    # @option args [Hash]   :data
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
