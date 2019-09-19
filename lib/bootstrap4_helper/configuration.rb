# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class Configuration
    SETTINGS = %i[
      autoload_in_views
    ].freeze

    attr_accessor(*SETTINGS)

    # @description
    # -
    #
    # @params [Hash] args
    # @return [ClassName]
    #
    def initialize(_args = {})
      @autoload_in_views = true
    end

    # @description
    # - Simple predicate method
    #
    def autoload_in_views?
      @autoload_in_views
    end
  end
end
