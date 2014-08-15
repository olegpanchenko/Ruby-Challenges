class DictionarySearch
  def initialize(file_path)
    words = {}
    @pairs = []
    File.open(file_path, "r").each_line do |word|
      word.gsub!(/\r\n?/, "")
      next if word.size < 3

      transformed = transform(word)
      # next if word == transformed

      if words.has_key?(transformed)
        @pairs.push [transformed, word]
      else
        words[word] = transformed
      end
    end

  end
  
  def word_pairs
    @pairs
  end

  def transform word
    size = word.size
    "#{word[0..(size - 3)]}#{word[size - 1]}#{word[size - 2]}"
  end
end  