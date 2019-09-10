require 'bootstrap4_helper/version'
require 'bootstrap4_helper/railtie'
require 'bootstrap4_helper/constants'

Bootstrap4Helper::Constants::COMPONENTS.each do |component|
  require "bootstrap4_helper/#{component}"
end

# @todo
# - We need a configuration system so people can specify what DOM elements to
# use when building components.  Like, so we want <h1> for Card Headers or just
# <div>'s.
#
module Bootstrap4Helper
  # @description
  # - Creates an Alert component.
  #
  # <code>
  #   <%= alert_helper :danger, dismissble: true do %>
  #     Something went wrong with your model data...
  #   <% end %>
  # </code>
  #
  # @params [Symbol|String|Hash|NilClass] *args
  # @return [String]
  #
  def alert_helper(*args, &block)
    Alert.new(self, *args, &block)
  end

  # @description
  # -
  #
  # @params [Symbol|String|Hash|NilClass] *args
  # @return [String]
  #
  def badge_helper(*args, &block)
    Badge.new(self, *args, &block)
  end

  # @description
  # -
  #
  def card_helper(*args, &block)
    Card.new(self, *args, &block)
  end

  # @description
  # -
  #
  def card_group_helper(*args, &block)
    CardGroup.new(self, *args, &block)
  end

  # @description
  # -
  #
  def card_deck_helper(*args, &block)
    CardDeck.new(self, *args, &block)
  end

  # @description
  # -
  #
  def card_column_helper(*args, &block)
    CardColumn.new(self, *args, &block)
  end
end
