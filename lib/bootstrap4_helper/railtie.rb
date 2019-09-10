module Bootstrap4Helper
  # @description
  #
  #
  class Railtie < ::Rails::Railtie
    initializer 'bootsrap4_helper' do
      ActiveSupport.on_load(:action_view) { include Bootstrap4Helper }
    end
  end
end
