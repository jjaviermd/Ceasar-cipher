def get_index(letter)
    return letter unless ("a".."z").to_a.include?(letter)
    ("a".."z").to_a.index(letter)
  end
  
  def sum_index (index, factor)
    if index.is_a? Numeric
      return (index + factor) - 26 if index + factor > 25
      index + factor
    else
      return index
    end
  end
  
  def index_to_letter(index)
    return ("a".."z").to_a[index] if index.is_a? Numeric
    index
  end
  
  def cipher(str, num)
    temp_arr = str.downcase.split(' ')
    temp_arr.map do |word|
      word.split("").
      map {|char|get_index(char)}
      .map {|e|sum_index(e, num)}
      .map {|e|index_to_letter(e)}
      .join('')
    end
    .join(" ").capitalize
  end