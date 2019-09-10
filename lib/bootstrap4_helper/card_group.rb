# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class CardGroup < CardGrouping
    # @description
    # -
    #
    def to_s
      content_tag :div, id: @id, class: "card-group #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end
