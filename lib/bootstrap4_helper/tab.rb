# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class Tab < Component
    # @description
    # -
    #
    # @param [ActionView] template
    # @param [NilClass|String|Symbol|Hash] context_or_options
    # @param [Hash]
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @type    = opts.fetch(:type,  :tabs)
      @id      = opts.fetch(:id,    uuid)
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  {})
      @content = block || proc { '' }
    end

    # @description
    # -
    #
    def nav(opts = {}, &block)
      opts[:class] = (opts[:class] || '') << " nav-#{@type}"
      opts[:data]  = (opts[:data]  || {}).merge(toggle: 'tab')
      opts[:child] = {
        data: {
          toggle: 'tab'
        }
      }

      Nav.new(@template, opts, &block)
    end

    # @description
    # -
    #
    def content(opts = {}, &block)
      Content.new(@template, opts, &block)
    end

    # @description
    # - This has a weird interaction.  Because this object doesn't actually return any wrapping
    # string or DOM element, we want to return nil, so that only the output buffer on the sub components are returned.
    # If we return the return value of the block, we will get the last element added to the input
    # buffer as an unescaped string.
    #
    def to_s
      @content.call(self)

      nil
    end
  end
end
