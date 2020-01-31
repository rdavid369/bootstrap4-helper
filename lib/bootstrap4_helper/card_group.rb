module Bootstrap4Helper
  # Creates a Card Group component
  #
  #
  class CardGroup < CardGrouping
    # String representation of the object
    #
    #
    def to_s
      content_tag :div, id: @id, class: "card-group #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end
