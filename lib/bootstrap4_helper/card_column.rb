module Bootstrap4Helper
  # Creates a Card Column Component.
  #
  #
  class CardColumn < CardGrouping
    # String representation of the object.
    #
    #
    def to_s
      content_tag :div, id: @id, class: "card-columns #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end
