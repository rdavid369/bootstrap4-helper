require 'bootstrap4_helper/version'
require 'bootstrap4_helper/railtie'
require 'bootstrap4_helper/constants'

Bootstrap4Helper::Constants::COMPONENTS.each do |component|
  require "bootstrap4_helper/#{component}"
end

require 'bootstrap4_helper/initialize'

# This is the module that will get included in your partials.
#
#
module Bootstrap4Helper
  # Creates a single Accordion element.  The header component
  # already provides the DOM element to link the Collapse area.
  # You just need to provide the text or additional markup, if
  # you want it.
  #
  # ```erb
  #  <%= accordion_helper do |a| %>
  #    <%= a.header do %>
  #      // Some HTML or Ruby
  #    <% end %>
  #    <%= a.body %>
  #      // Some HTML or Ruby
  #    <% end %>
  #  <% end %>
  # ```
  #
  # @param  [Hash] opts
  # @return [Accordion]
  #
  def accordion_helper(opts = {}, &block)
    Accordion.new(self, opts, &block)
  end

  # Creates a group of Accordions that stay in sync with each other.
  # One opens, the other closes.
  #
  # ```erb
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
  # ```
  #
  # @param  [Mixed] args
  # @return [Accordion]
  #
  def accordion_group_helper(*args, &block)
    AccordionGroup.new(self, *args, &block)
  end

  # Creates an Alert component.
  #
  # ```erb
  #   <%= alert_helper :danger, dismissble: true do %>
  #     Something went wrong with your model data...
  #   <% end %>
  # ```
  #
  # @param  [Mixed] args
  # @return [String]
  #
  def alert_helper(*args, &block)
    Alert.new(self, *args, &block)
  end

  # Creates a badge component.  Badges have a context variable.  Providing nothing
  # will give you the `secondary` context.
  #
  # ```erb
  #  <li>
  #    Messages: <%= badge_helper(:primary) { @messages.count } %>
  #  </li>
  #  <li>
  #    Notifications: <%= badge_healper { @notifications.count } %>
  #  </li>
  # ```
  #
  # @param  [Mixed] args
  # @return [String]
  #
  def badge_helper(*args, &block)
    Badge.new(self, *args, &block)
  end

  # Creates a Card component.
  #
  #
  # ```erb
  #
  # <%# Regular %>
  #
  #   <%= card_helper do |c| %>
  #     <%= c.header class: 'text-white bg-primary' do %>
  #         <h4>This is the header...</h4>
  #     <% end %>
  #     <%= c.body do %>
  #         <%= c.title { 'This is the title' } %>
  #         <%= c.text { 'This card body' } %>
  #         <ul>
  #             <% [1, 2, 3].each do |x|  %>
  #                 <li>Item: <%= x %></li>
  #             <% end %>
  #         </ul>
  #     <% end %>
  #     <%= c.footer do %>
  #         This is the footer...
  #     <% end %>
  #   <% end %>
  #
  # <%# Horizontal %>
  #
  #  <div class="row">
  #    <div class="col-sm mt-3 mb-3">
  #        <%= card_helper do |c| %>
  #            <div class="row no-gutters">
  #                <div class="col-md-4">
  #                    <%= image_tag 'placeholder.svg', class: 'card-img' %>
  #                </div>
  #                <div class="col-md-8">
  #                    <%= c.body do %>
  #                        <%= c.title { "Card title" } %>
  #                        <%= c.text { "This is a wider card with supporting text below as a natural lead-in to additional content." } %>
  #                        <%= c.text do %>
  #                            <small class="text-muted">Last updated 3 mins ago</small>
  #                        <% end %>
  #                   <% end %>
  #                </div>
  #            </div>
  #        <% end %>
  #    </div>
  #  </div>
  # ```
  #
  # @param  [Hash] opts
  # @return [String]
  #
  def card_helper(opts = {}, &block)
    Card.new(self, opts, &block)
  end

  # Builds a card group.
  #
  # ```erb
  #  <%= card_group_helper do |group| %>
  #    <%= group.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title one' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3, 4, 5, 6, 7].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #
  #    <%= group.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title two' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #
  #    <%= group.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title three' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #  <% end %>
  # ```
  #
  # @param  [Hash] opts
  # @return [String]
  #
  def card_group_helper(opts = {}, &block)
    CardGroup.new(self, opts, &block)
  end

  # Builds a card deck.
  #
  # ```erb
  #  <%= card_deck_helper do |deck| %>
  #    <%= deck.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title one' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3, 4, 5, 6, 7].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #
  #    <%= deck.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title two' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #
  #    <%= deck.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title three' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #  <% end %>
  # ```
  #
  # @param  [Hash] opts
  # @return [String]
  #
  def card_deck_helper(opts = {}, &block)
    CardDeck.new(self, opts, &block)
  end

  # Builds a card column.
  #
  # ```erb
  #  <%= card_column_helper do |column| %>
  #    <%= column.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title one' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3, 4, 5, 6, 7].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #
  #    <%= column.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title two' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #
  #    <%= column.card do |c| %>
  #        <%= c.body do %>
  #            <%= c.title { 'This is the title three' } %>
  #            <%= c.text { 'This card body' } %>
  #            <ul>
  #                <% [1, 2, 3].each do |x|  %>
  #                    <li>Item: <%= x %></li>
  #                <% end %>
  #            </ul>
  #        <% end %>
  #        <%= c.footer do %>
  #            This is the footer...
  #        <% end %>
  #    <% end %>
  #  <% end %>
  # ```
  #
  # @param  [Hash] opts
  # @return [String]
  #
  def card_column_helper(opts = {}, &block)
    CardColumn.new(self, opts, &block)
  end

  # Generates a Dropdown component.  Default type `:dropdown`.  For inline buttons, use
  # `:group`.
  #
  # ```erb
  #  <%= dropdown_helper do |dropdown| %>
  #    <%= dropdown.button(:primary) { "Action" } %>
  #    <%= dropdown.menu do |menu| %>
  #        <%= menu.link 'Edit', '#' %>
  #        <%= menu.link 'Delete', '#' %>
  #        <%= menu.text 'Static text' %>
  #    <% end %>
  #  <% end %>
  #
  #  <%= dropdown_helper :group, class: 'dropright' do |dropdown| %>
  #    <button type="button" class="btn btn-danger">Action 2</button>
  #    <%= dropdown.button(:danger, split: true) %>
  #    <%= dropdown.menu do |menu| %>
  #        <%= menu.header "Crud operations" %>
  #        <%= menu.divider %>
  #        <%= menu.link 'Edit', '#' %>
  #        <%= menu.link 'Delete', '#' %>
  #    <% end %>
  #  <% end %>
  #
  #  <%= dropdown_helper do |dropdown| %>
  #    <%= dropdown.button :primary do %>
  #        Login
  #    <% end %>
  #    <%= dropdown.menu do |menu| %>
  #        <form class="px-4 py-3">
  #            <div class="form-group">
  #                <label for="exampleDropdownFormEmail1">Email address</label>
  #                <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
  #            </div>
  #            <div class="form-group">
  #                <label for="exampleDropdownFormPassword1">Password</label>
  #                <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
  #            </div>
  #            <div class="form-group">
  #                <div class="form-check">
  #                    <input type="checkbox" class="form-check-input" id="dropdownCheck">
  #                    <label class="form-check-label" for="dropdownCheck">
  #                        Remember me
  #                    </label>
  #                </div>
  #            </div>
  #            <button type="submit" class="btn btn-primary">Sign in</button>
  #        </form>
  #        <%= menu.divider %>
  #        <%= menu.link "New around here? Sign up", "#" %>
  #        <%= menu.link "Forgot password", "#" %>
  #    <% end %>
  #  <% end %>
  # ```
  #
  # @param  [Mixed] args
  # @return [String]
  #
  def dropdown_helper(*args, &block)
    Dropdown.new(self, *args, &block)
  end

  # Generates Modal windows.
  #
  # ```erb
  #  <%= modal_helper id: 'exampleModal' do |m| %>
  #    <%= m.header do %>
  #        <%= m.title { 'Example Modal' } %>
  #        <%= m.close_button %>
  #    <% end %>
  #    <%= m.body do %>
  #        Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel nisi tempora, eius iste sit nobis
  #        earum in harum optio dolore explicabo. Eveniet reprehenderit harum itaque ad fuga beatae, quasi
  #        sequi! Laborum ea porro nihil ipsam repudiandae vel harum voluptates minima corrupti unde quas,
  #        dolore possimus doloribus voluptatem sint fuga dolores odio dignissimos at molestias earum.
  #    <% end %>
  #    <%= m.footer do %>
  #        <%= m.close_button class: 'btn btn-secondary' do %>
  #            Close
  #        <% end %>
  #    <% end %>
  #  <% end %>
  # ```
  #
  # @param  [Hash] opts
  # @return [String]
  #
  def modal_helper(opts = {}, &block)
    Modal.new(self, opts, &block)
  end

  # Generates Nav components.
  #
  # ```erb
  #  <%= nav_helper do |nav| %>
  #    <%= nav.link "Item 1", "https://www.google.com" %>
  #    <%= nav.link "Item 2", "#" %>
  #    <%= nav.link "Item 3", "#" %>
  #    <%= nav.dropdown :more do |menu| %>
  #        <%= menu.link 'People', '#' %>
  #        <%= menu.link 'Records', '#' %>
  #    <% end %>
  #
  #    <%= nav.dropdown "More 2" do |menu| %>
  #        <%= menu.link 'People', '#' %>
  #        <%= menu.link 'Records', '#' %>
  #    <% end %>
  #  <% end %>
  # ```
  #
  # @param  [Hash] opts
  # @return [String]
  #
  def nav_helper(opts = {}, &block)
    Nav.new(self, opts, &block)
  end

  # Generates a Tab component.
  #
  # ```erb
  #  <%= tab_helper do |tab| %>
  #    <%= tab.nav do |nav| %>
  #        <%= nav.item :item1 do %>
  #            Item 1
  #        <% end %>
  #        <%= nav.item(:item2, class: 'active') { "Item 2" } %>
  #        <%= nav.item(:item3) { "Item 3" } %>
  #        <%= nav.item :item4 %>
  #        <%= nav.dropdown 'More' do |dropdown| %>
  #            <%= dropdown.item :item5 %>
  #            <%= dropdown.item(:item6) { 'Item 6' } %>
  #        <% end %>
  #    <% end %>
  #
  #    <%= tab.content do |content| %>
  #        <%= content.pane :item1, class: 'mt-3' do %>
  #            Content 1
  #        <% end %>
  #
  #        <%= content.pane :item2, class: 'active mt-3' do %>
  #            Content 2
  #        <% end %>
  #
  #        <%= content.pane :item3, class: 'mt-3' do %>
  #            Content 3
  #        <% end %>
  #
  #        <%= content.pane :item4, class: 'mt-3' do %>
  #            Content 4
  #        <% end %>
  #
  #        <%= content.pane :item5, class: 'mt-3' do %>
  #            Content 5
  #        <% end %>
  #
  #        <%= content.pane :item6, class: 'mt-3' do %>
  #            Content 6
  #        <% end %>
  #    <% end %>
  #  <% end %>
  # ```
  # @param  [Mixed] args
  # @return [String]
  #
  def tab_helper(*args, &block)
    Tab.new(self, *args, &block)
  end

  # Generates spinner annimations.
  #
  # ```erb
  #  <%= spinner_helper class: 'text-warning' %>
  #  <%= spinner_helper type: :grow, class: 'text-danger', id: 'loadingRecords' %>
  # ```
  # @param  [Mixed] args
  # @return [String]
  #
  def spinner_helper(*args, &block)
    Spinner.new(self, *args, &block)
  end
end
