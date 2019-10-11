# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class Configuration
    DEFAULT_SETTINGS = {
      autoload_in_views: true,
      card_title:        :h5,
      card_text:         :p,
      accordion_header:  :h5,
      badge:             :span
    }.freeze

    attr_accessor(*DEFAULT_SETTINGS.keys)

    # @description
    # -
    #
    # @params [Hash] args
    # @return [ClassName]
    #
    def initialize(_args = {})
      DEFAULT_SETTINGS.each { |key, value| instance_variable_set("@#{key}", value) }
    end

    # @description
    # - Simple predicate method
    #
    def autoload_in_views?
      @autoload_in_views
    end
  end
end
