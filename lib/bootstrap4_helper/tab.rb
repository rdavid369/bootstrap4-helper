module Bootstrap4Helper
  # Builds a Tab component.
  #
  #
  class Tab < Component
    # Class constructor
    #
    # @note The support types are: `:tabs` and `:pills`
    #
    # @param [ActionView] template
    # @param [Hash] opts
    # @option opts [Symbol]  :type
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    #
    def initialize(template, opts = {}, &block)
      super(template)

      @type    = opts.fetch(:type,  :tabs)
      @id      = opts.fetch(:id,    uuid)
      @class   = opts.fetch(:class, '')
      @data    = opts.fetch(:data,  {})
      @content = block || proc { '' }
    end

    # Builds a custom Nav component for the tabs.
    #
    # @param  [Hash] opts
    # @option opts [String] :class
    # @option opts [Hash]   :data
    # @return [Nav]
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

    # Builds the Content object for the Tab.
    #
    # @param  [Hash] opts
    # @option opts [String]  :id
    # @option opts [String]  :class
    # @option opts [Hash]    :data
    # @return [Tab::Content]
    #
    def content(opts = {}, &block)
      Content.new(@template, opts, &block)
    end

    # This has a weird interaction.  Because this object doesn't actually return any wrapping
    # string or DOM element, we want to return nil, so that only the output buffer on the sub components are
    # returned.
    # If we return the return value of the block, we will get the last element added to the input
    # buffer as an unescaped string.
    #
    def to_s
      @content.call(self)

      nil
    end
  end
end
