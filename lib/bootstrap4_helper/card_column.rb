# @root
#
#
module Bootstrap4Helper
  # @description
  #
  #
  class CardColumn < CardGrouping
    # @description
    # -
    #
    def to_s
      content_tag :div, id: @id, class: "card-columns #{@class}", data: @data do
        @content.call(self)
      end
    end
  end
end
