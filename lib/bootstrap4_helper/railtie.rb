module Bootstrap4Helper
  # Simple Railtie to hook out module into ActionView.
  #
  #
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      ActiveSupport.on_load(:action_view) do
        include Bootstrap4Helper if Bootstrap4Helper.config.autoload_in_views?
      end
    end
  end
end
