def ex1(input)
  substr = ''
  res = []
  state = 0

  input.each_char do |char|
    case char
    when '1'
      case state
      when 0
        state = 1
        substr << '1'
      when 1
        state = 2
        substr << '1'
      when 3
        substr << '1'
        res << substr
        substr = ''
        state = 0
      else
        state = 0
        substr = ''
      end
    when '0'
      case state
      when 1, 2, 3
        state = 3
        substr << '0'
      else
        state = 0
        substr = ''
      end
    else
      state = 0
      substr = ''
    end
  end

  res
end

def main
  input = gets.chomp
  result = ex1(input)
  result.each { |str| puts str }
end

main