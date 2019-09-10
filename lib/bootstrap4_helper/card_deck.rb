# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class CardDeck < CardGrouping
    # @description
    # -
    #
    def to_s
      content_tag :div, id: @id, class: "card-deck #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end
