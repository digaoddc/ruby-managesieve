
module Sieve
  # This class contains the attributes of conditions/tests 
  class Condition
    attr_accessor :test,:not,:arg1,:arg2,:type

    def initialize
      @test=nil
      @not=nil
      @arg1=nil
      @arg2=nil
      @type=nil
    end
    # Return a array of conditions after parse the text
    #@param [string] text of conditions
    #@note Example:
    # anyof (header :contains "From" "all", header :contains "aaaaa" "333")
    #@return [Array(Contition)] array of Condition
    def self.parse_all(text)

    end

    # Return a object of Condition parsing text of condition
    #@note Example:
    # header :contains "From" "all"
    #@param [string] text of condition
    #@return [Condition] object of condition
    def self.parse(text)

    end
  end
end