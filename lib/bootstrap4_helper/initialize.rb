module Bootstrap4Helper
  # Naming convention used as to not pollute views where the module is
  # included.  @config is a common instance variable name.  We don't want
  # to risk overriding another developers variable.
  #
  @_bs4h_config = Configuration.new

  class << self
    # Simple interface for exposing the configuration object.
    #
    # @return [Bootstrap4Helper::Configuration]
    #
    def config
      yield @_bs4h_config if block_given?

      @_bs4h_config
    end
  end
end
