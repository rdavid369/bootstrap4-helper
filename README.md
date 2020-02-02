# Bootstrap4Helper

Simple template helper to build Bootstrap 4 components in Rails views easier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bootstrap4_helper'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install bootstrap4_helper
```

## Usage

All of the helpers will be available inside your views. If you wish to stop that behavior and only include the helpers on the views of your choosing, pass the following to the `config` object in a intializer:

<em>config/initializers/bootstrap4-helper.rb</em>

```ruby
Bootstrap4Helper.config do |config|
  config.autoload_in_views = false
end
```

> Note: Almost all the helpers support attributes for `id`, `class` and `data` HTML attributes.

### Accordion:

For use with a single, collapsible accordion.

```erb
<%= accordion_helper class: 'text-white bg-primary' do |a| %>
    <%= a.header do %>
        // Some HTML or Ruby
    <% end %>
    <%= a.body %>
        // Some HTML or Ruby
    <% end %>
<% end %>
```

### Accordion Groups:

Use the group helper when you want to have a group of accordions, where one opens and the previous one closes.

> Note: The helper will handle all the linking of the elements together. If you do pass an id to the parent Dom Element - accordion_grou_helper id: 'some_id', that id will be used for the linking of the element. But you don't have to, unless you have a specific need to.

```erb
<%= accordion_group_helper do |grp| %>
    <%= grp.accordion do |a| %>
        <%= a.header class: 'text-white bg-primary' do %>
            // Some HTML or Ruby
        <% end %>
        <%= a.body %>
            // Some HTML or Ruby
        <% end %>
    <% end %>

    <%= grp.accordion do |a| %>
        <%= a.header class: 'text-white bg-danger' do %>
            // Some HTML or Ruby
        <% end %>
        <%= a.body %>
            // Some HTML or Ruby
        <% end %>
    <% end %>
<% end $>
```

### Alerts

Alerts use the contextual helper, where you can pass one of the states to the object and it will render the appropriate colors.

```erb
<%= alert_helper :danger, dismissble: true do %>
    Something went wrong with your model data...
<% end %>
```

### Badges

The badge helper will build badges realitively quickly. If you are just passing a String, use the shorter curly brace block syntax. If you plan on building other HTML elements of using other Ruby proceedures, use the do/end method.

```erb
<li>
   Messages: <%= badge_helper(:primary) { @messages.count } %>
</li>
<li>
   Notifications: <%= badge_healper { @notifications.count } %>
</li>
<li>
    Users: <%= badge_helper :danger do %>Some HTML / Ruby <% end %>
</li>
```

### Cards

Cards support a few methods that make building them easier:

- `body`
- `header`
- `footer`
- `image_overlay`
- `text`
- `title`

For usage on various card sub components, @see https://getbootstrap.com/docs/4.0/components/card/

```erb
<%# Regular %>

<%= card_helper do |c| %>
    <%= c.header class: 'text-white bg-primary' do %>
        <h4>This is the header...</h4>
    <% end %>
    <%= c.body do %>
        <%= c.title { 'This is the title' } %>
        <%= c.text { 'This card body' } %>
        <ul>
            <% [1, 2, 3].each do |x|  %>
                <li>Item: <%= x %></li>
            <% end %>
        </ul>
    <% end %>
    <%= c.footer do %>
        This is the footer...
    <% end %>
<% end %>

<%# Horizontal %>

<div class="row">
    <div class="col-sm mt-3 mb-3">
        <%= card_helper do |c| %>
            <div class="row no-gutters">
                <div class="col-md-4">
                    <%= image_tag 'placeholder.svg', class: 'card-img' %>
                </div>
                <div class="col-md-8">
                    <%= c.body do %>
                        <%= c.title { "Card title" } %>
                        <%= c.text { "This is a wider card with supporting text below as a natural lead-in to additional content." } %>
                        <%= c.text do %>
                            <small class="text-muted">Last updated 3 mins ago</small>
                        <% end %>
                    <% end %>
                </div>
            </div>
        <% end %>
    </div>
</div>
```

### Card Groups

Card Groups are a group of cards.

> Use card groups to render cards as a single, attached element with equal width and height columns. Card groups use display: flex; to achieve their uniform sizing. - Bootstrap Docs

```erb
<%= card_group_helper do |group| %>
    <%= group.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title one' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3, 4, 5, 6, 7].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
    <%= group.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title two' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
    <%= group.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title three' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
<% end %>
```

### Card Decks

Card Decks are for, well, decks of cards :D

> Need a set of equal width and height cards that aren’t attached to one another? Use card decks. - Bootstrap 4 Docs

```erb
<%= card_deck_helper do |deck| %>
    <%= deck.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title one' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3, 4, 5, 6, 7].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
    <%= deck.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title two' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
    <%= deck.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title three' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
<% end %>
```

### Card Columns

Build Card Columns.

> Cards are built with CSS column properties instead of flexbox for easier alignment. Cards are ordered from top to bottom and left to right.
>
> Heads up! Your mileage with card columns may vary. To prevent cards breaking across columns, we must set them to display: inline-block as column-break-inside: avoid isn’t a bulletproof solution yet. <br>- Bootstrap Docs

```erb
<%= card_column_helper do |column| %>
    <%= column.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title one' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3, 4, 5, 6, 7].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
    <%= column.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title two' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
    <%= column.card do |c| %>
        <%= c.body do %>
            <%= c.title { 'This is the title three' } %>
            <%= c.text { 'This card body' } %>
            <ul>
                <% [1, 2, 3].each do |x|  %>
                    <li>Item: <%= x %></li>
                <% end %>
            </ul>
        <% end %>
        <%= c.footer do %>
            This is the footer...
        <% end %>
    <% end %>
<% end %>
```

### Dropdowns

Generates a Dropdown component. Default type `:dropdown`. For inline buttons, use `:group`.

Dropdowns support the following methods:

- `button`
- `menu`
  - `item` - Use this method when you are using the item in the menu as trigger for tab content.
  - `link` - Use this method when the item in the menu is nothing more than a hyperlink.
  - `text` - simple text
  - `header` - Is a header item
  - `divider` - A dividing element

```erb
<%= dropdown_helper do |dropdown| %>
    <%= dropdown.button(:primary) { "Action" } %>
    <%= dropdown.menu do |menu| %>
        <%= menu.link 'Edit', '#' %>
        <%= menu.link 'Delete', '#' %>
        <%= menu.text 'Static text' %>
    <% end %>
<% end %>

<%= dropdown_helper :group, class: 'dropright' do |dropdown| %>
    <button type="button" class="btn btn-danger">Action 2</button>
    <%= dropdown.button(:danger, split: true) %>
    <%= dropdown.menu do |menu| %>
        <%= menu.header "Crud operations" %>
        <%= menu.divider %>
        <%= menu.link 'Edit', 'SOME-URL' %>
        <%= menu.link 'Delete', 'SOME-URL' %>
    <% end %>
<% end %>

<%= dropdown_helper do |dropdown| %>
    <%= dropdown.button :primary do %>
        <i class="fas fa-users"></i> User
    <% end %>
    <%= dropdown.menu do |menu| %>
        <form class="px-4 py-3">
            <div class="form-group">
                <label for="exampleDropdownFormEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
            </div>
            <div class="form-group">
                <label for="exampleDropdownFormPassword1">Password</label>
                <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
            </div>
            <div class="form-group">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="dropdownCheck">
                    <label class="form-check-label" for="dropdownCheck">
                        Remember me
                    </label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Sign in</button>
        </form>
        <%= menu.divider %>
        <%= menu.link "New around here? Sign up", "#" %>
        <%= menu.link "Forgot password", "#" %>
    <% end %>
<% end %>
```

### Modals

Builds a modal window.

> Note: When the `close_button` is not passed a block, it will default to the X icon.

```erb
<%= modal_helper id: 'exampleModal' do |m| %>
    <%= m.header do %>
        <%= m.title { 'Example Modal' } %>
        <%= m.close_button %>
    <% end %>
    <%= m.body do %>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel nisi tempora, eius iste sit nobis
        earum in harum optio dolore explicabo. Eveniet reprehenderit harum itaque ad fuga beatae, quasi
        sequi! Laborum ea porro nihil ipsam repudiandae vel harum voluptates minima corrupti unde quas,
        dolore possimus doloribus voluptatem sint fuga dolores odio dignissimos at molestias earum.
    <% end %>
    <%= m.footer do %>
        <%= m.close_button class: 'btn btn-secondary' do %>
            Close
        <% end %>
    <% end %>
<% end %>
```

### Navs

For building nav components. The Nav compoent has the following methods:

- `dropwdown` - @see Dropdown for list of methods
- `item`
- `link`

```erb
<%= nav_helper do |nav| %>
    <%= nav.link "Item 1", "https://www.google.com" %>
    <%= nav.link "Item 2", "#" %>
    <%= nav.link "Item 3", "#" %>
    <%= nav.dropdown :more do |menu| %>
        <%= menu.link 'People', '#' %>
        <%= menu.link 'Records', '#' %>
    <% end %>

    <%= nav.dropdown "More 2" do |menu| %>
        <%= menu.link 'People', '#' %>
        <%= menu.link 'Records', '#' %>
    <% end %>
<% end %>
```

### Tabs

For building Tab components.

> Note: The tab helper responds to the `type:` and there are two types, `:tabs` and `:pills`. The default is `:tabs`.
>
> Example:
> `<%= tab_helper type: :pills do |tab| %>`

```erb
<%= tab_helper do |tab| %>
    <%= tab.nav do |nav| %>
        <%= nav.item :item1 do %>
            Item 1
        <% end %>
        <%= nav.item(:item2, class: 'active') { "Item 2" } %>
        <%= nav.item(:item3) { "Item 3" } %>
        <%= nav.item :item4 %>
        <%= nav.dropdown 'More' do |dropdown| %>
            <%= dropdown.item :item5 %>
            <%= dropdown.item(:item6) { 'Item 6' } %>
        <% end %>
    <% end %>

    <%= tab.content do |content| %>
        <%= content.pane :item1, class: 'mt-3' do %>
            Content 1
        <% end %>

        <%= content.pane :item2, class: 'active mt-3' do %>
            Content 2
        <% end %>

        <%= content.pane :item3, class: 'mt-3' do %>
            Content 3
        <% end %>

        <%= content.pane :item4, class: 'mt-3' do %>
            Content 4
        <% end %>

        <%= content.pane :item5, class: 'mt-3' do %>
            Content 5
        <% end %>

        <%= content.pane :item6, class: 'mt-3' do %>
            Content 6
        <% end %>
    <% end %>
<% end %>
```

### Spinners

Creates CSS spinner components. Supports two types: `:border` and `:grow`. Teh default is `:border`

```erb
<%= spinner_helper class: 'text-warning' %>
<%= spinner_helper type: :grow, class: 'text-danger', id: 'loadingRecords' %>
```

## Contributing

If you would like to contribution, by all means, do a PR and send up your suggestions.

If there are components you would like to see added, open an issue and I will try to get to them, or you can do a PR and add them yourself :D

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
