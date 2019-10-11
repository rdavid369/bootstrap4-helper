# @root
#
#
module Bootstrap4Helper
  # @description
  # - This super class is meant to contain commonly used methods that
  # all sub classes can leverage.
  #
  # @note
  # - Every component that inherits from this class, needs to call the parent
  # initialization method! In order to properly render erb blocks within the
  # proper context, we need the template. The only way to get this, is to pass
  # in the template.
  #
  # @note
  # - the `context` mentioned above, refers to the context of `@template` and
  # not to be confused with `@context` that can be found in the sub classes.
  # `@context` refers to the Bootstrap class context of the component.
  #
  class Component
    # @description
    # - Used to ensure that the helpers always have the propert context for
    # rendering and bindings.
    #
    # @param [Class] template - the context of the bindings
    #
    def initialize(template)
      @template = template
    end

    # @description
    # - Used to pass all context of content_tag to the template.  This ensures
    # proper template binding of variables and methods!
    #
    # @return [String]
    #
    def content_tag(
      name,
      content_or_options_with_block = nil,
      options = nil,
      escape = true,
      &block
    )
      @template.content_tag(
        name,
        content_or_options_with_block,
        options,
        escape,
        &block
      )
    end

    # @description
    # -
    #
    def capture(*args)
      @template.capture(*args)
    end

    # @description
    # - Used to pass all concat references to the template.  This ensures proper
    # binding. Concat adds a String to the template Output buffer.  Useful when
    # trying to add a String with no block.
    #
    # @params [String] text
    #
    def concat(text)
      @template.concat(text)
    end

    # @description
    # - Used to parse method arguments.  If the first argument is
    # a Hash, then it is assumed that the user left off the bootstrap
    # contectual class.  So we will assign it to `secondary` and
    # return the Hash to be used as options.
    #
    # @params [Hash|NilClass|String|Symbol] *args
    # @return [Array]
    #
    def parse_arguments(*args)
      first, second = *args
      case first
      when Hash, NilClass
        ['secondary', first || second]
      when Symbol, String
        [first, second]
      end
    end

    # @description
    # - Used to generate a (hopefully) unique ID for DOM elements.  Used as a
    # fallback if the user doesn't specify one.
    #
    # @return [String]
    #
    def uuid
      (0...10).map { rand(65..90).chr }.join
    end

    # @description
    # - Used to get config settings inside of components quicker.
    #
    # @param [Symbol] setting
    # @return [Mixed]
    #
    def config(setting, fallback)
      Bootstrap4Helper.config.send(setting) || fallback
    end
  end
end
