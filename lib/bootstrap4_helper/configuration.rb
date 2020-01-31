module Bootstrap4Helper
  # Simple configuration object for setting options for the gem.
  #
  # @todo Build a better, more comprehensive system.
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

    # Class constructor
    #
    # @param  [Hash] _args
    # @return [ClassName]
    #
    def initialize(_args = {})
      DEFAULT_SETTINGS.each { |key, value| instance_variable_set("@#{key}", value) }
    end

    # Simple predicate method
    #
    # @return [Boolean]
    #
    def autoload_in_views?
      @autoload_in_views
    end
  end
end
