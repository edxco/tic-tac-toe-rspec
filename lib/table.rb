require_relative 'colors.rb'
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
class Table
  attr_reader :table

  def initialize
    @table = {
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
      "5": 5,
      "6": 6,
      "7": 7,
      "8": 8,
      "9": 9
    }
  end

  def modify_table(move = nil, sign = nil)
    @table[:"#{move}"] = case sign
                         when 'x'
                           sign.pink
                         when 'o'
                           sign.yellow
                         else
                           sign
                         end
  end

  def valid_move(move)
    check = @table[:"#{move}"]
    check == 'o'.yellow || check == 'x'.pink || move > 9 || move < 1 ? true : false
  end

  def check_win
    if @table[:"1"] == @table[:"2"] && @table[:"3"] == @table[:"1"]
      1
    elsif @table[:"4"] == @table[:"5"] && @table[:"4"] == @table[:"6"]
      1
    elsif @table[:"7"] == @table[:"8"] && @table[:"7"] == @table[:"9"]
      1
    elsif @table[:"7"] == @table[:"4"] && @table[:"7"] == @table[:"1"]
      2
    elsif @table[:"8"] == @table[:"5"] && @table[:"8"] == @table[:"2"]
      2
    elsif @table[:"9"] == @table[:"6"] && @table[:"9"] == @table[:"3"]
      2
    elsif @table[:"7"] == @table[:"5"] && @table[:"5"] == @table[:"3"]
      3
    elsif @table[:"1"] == @table[:"5"] && @table[:"5"] == @table[:"9"]
      3
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
