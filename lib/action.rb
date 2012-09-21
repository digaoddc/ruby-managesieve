
module Sieve
    
  # This class contains the attributes of action 
  class Action
    attr_accessor :type, :copy, :target

    def initialize
      @type=nil
      @copy=nil
      @target=nil
    end
    
    # Return a array of actions after parse the text
    #@note Example:
    #  fileinto "INBOX";
    #  fileinto :copy "INBOX.lixo";
    #  stop;
    #@param [string] text of actions
    #@return [Array(Action)] array of Actions
    def self.parse_all(text)

    end

    # Return actions object after parse the text
    #@note Example:
    #  fileinto :copy "INBOX.lixo";
    #@param [string] text of action
    #@return [Action] object of Action
    def self.parse(text)

    end
  end
end