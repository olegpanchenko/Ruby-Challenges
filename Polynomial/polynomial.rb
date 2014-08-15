class Polynomial
  def initialize(elements=[])
    @elements = elements
    raise ArgumentError, 'Two or more coefficients are required' unless valid_argument?
  end

  def to_s
    return '0' if all_zero?
    res = ""

    @elements.each_with_index do |coefficient, index|
      pow = @elements.size - index - 1
      res += Member.new(coefficient, pow, (index == 0)).to_s
    end

    res
  end

  def all_zero?
    @elements.uniq == [0]
  end

  def valid_argument?
    @elements != [1]
  end
end

class Member
  def initialize(coefficient, pow, first=true)
    @coefficient = coefficient
    @pow = pow
    @first = first
  end

  def to_s
    return "" if @coefficient == 0
    sign = detect_sign

    return "#{sign}#{@coefficient}" if @pow == 0

    res = sign
    res += "#{@coefficient.abs}" if @coefficient.abs != 1
    res += @pow == 1 ? "x" : "x^#{@pow}"

    res 
  end

  private
  def detect_sign
    sign = ''
    if @coefficient < 0
      sign = '-'
    elsif !@first
      sign = '+'
    end
    sign
  end
end