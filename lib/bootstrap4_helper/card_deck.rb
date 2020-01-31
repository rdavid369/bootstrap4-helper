module Bootstrap4Helper
  # Creates a Card Deck component
  #
  #
  class CardDeck < CardGrouping
    # String representation of the object.
    #
    #
    def to_s
      content_tag :div, id: @id, class: "card-deck #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end
