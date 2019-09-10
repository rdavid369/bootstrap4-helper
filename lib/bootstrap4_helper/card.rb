# @root
#
#
module Bootstrap4Helper
  # @description
  # -
  #
  #
  # @note
  # - Cards have the following components:
  #
  # - card
  #  -- card-header
  #   -- nav-tabs
  #   -- card-header-tabs
  #   -- nav-pills
  #   -- card-header-pills
  #
  #  -- card-img-top
  #  -- card-img-bottom
  #  -- card-header
  #  -- list-group
  #  -- card-footer
  #
  #  -- card-body
  #   -- card-title
  #   -- card-subtitle
  #   -- card-text
  #   -- card-link
  #
  #
  class Card < Component
    # @description
    # - Used to initialize a new Card component.
    #
    # @param [Class] template
    # @param [NilClass|String|Symbol|Hash] - Bootstrap class context, or options hash.
    # @param [Hash]  opts
    # @return [Card]
    #
    def initialize(template, context_or_options = nil, opts = {}, &block)
      super(template)

      @context, args = parse_arguments(context_or_options, opts)

      @id      = args.fetch(:id,    '')
      @class   = args.fetch(:class, '')
      @data    = args.fetch(:data,  nil)
      @content = block || proc { '' }
    end

    # @description
    # -
    #
    def header(args = {}, &block)
      build_base_component :header, args, &block
    end

    # @description
    # -
    #
    def body(args = {}, &block)
      build_base_component :body, args, &block
    end

    # @description
    # -
    #
    def footer(args = {}, &block)
      build_base_component :footer, args, &block
    end

    # @description
    # -
    #
    def title(args = {}, &block)
      build_sub_component :h5, :title, args, &block
    end

    # @description
    # -
    #
    def text(args = {}, &block)
      build_sub_component :p, :text, args, &block
    end

    # @description
    # -
    #
    def image_overlay(args = {}, &block)
      build_base_component 'img-overlay', args, &block
    end

    # @description
    # -
    #
    def to_s
      content_tag :div, id: @id, class: "card #{@class}", data: @data do
        @content.call(self)
      end
    end

    private

    # @description
    # -
    #
    def build_base_component(type, args, &block)
      build_sub_component :div, type, args, &block
    end

    # @description
    # -
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
