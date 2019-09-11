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
  # - Creates a single Accordion element.  The header component
  # already provides the DOM element to link the Collapse area.
  # You just need to provide the text or additional markup, if
  # you want it.
  #
  # <code>
  #  <%= accordion_helper do |a| %>
  #    <%= a.header do %>
  #      // Some HTML or Ruby
  #    <% end %>
  #    <%= a.body %>
  #      // Some HTML or Ruby
  #    <% end %>
  #  <% end %>
  # </code>
  #
  # @param [Mixed] args
  # @return [Accordion]
  #
  def accordion_helper(*args, &block)
    Accordion.new(self, *args, &block)
  end

  # @description
  # - Creates a group of Accordions that stay in sync with each other.
  # One opens, the other closes.
  #
  # <code>
  #  <%= accordion_group_helper do |grp| %>
  #    <%= grp.accordion do |a| %>
  #      <%= a.header class: 'text-white bg-primary' do %>
  #        // Some HTML or Ruby
  #      <% end %>
  #      <%= a.body %>
  #        // Some HTML or Ruby
  #      <% end %>
  #    <% end %>
  #
  #    <%= grp.accordion do |a| %>
  #      <%= a.header class: 'text-white bg-danger' do %>
  #        // Some HTML or Ruby
  #      <% end %>
  #      <%= a.body %>
  #        // Some HTML or Ruby
  #      <% end %>
  #    <% end %>
  #  <% end $>
  # </code>
  #
  # @param [Mixed] args
  # @return [Accordion]
  #
  def accordion_group_helper(*args, &block)
    AccordionGroup.new(self, *args, &block)
  end

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

  # @description
  # -
  #
  def modal_helper(*args, &block)
    Modal.new(self, *args, &block)
  end

  # @description
  # -
  #
  def spinner_helper(*args, &block)
    Spinner.new(self, *args, &block)
  end
end
