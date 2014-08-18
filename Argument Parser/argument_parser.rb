class ArgumentParser
  def initialize
  end
  
  def parse(args)
    return [""] if args == "{}"
    raise ArgumentError.new("Args list is invalid") unless valid?(args)

    args_array = args[1..-2].split(/(?<!\|),/).map(&:lstrip)
    args_array.map! {|x| x.gsub(/\|,/, ",") }
  end

  def valid? args
    valid = args.instance_of? String
    valid = valid && args[0,1] == '{'
    valid = valid && args[-1,1] == '}'
    valid = valid && /(?<!\|)[{}]/ === args
    #valid = valid && /(?<!\|),\S/ === args

    valid
  end
end

