# -*- coding: UTF-8 -*-

# This class implements a parse of sieve filter and returns a object
# to manipulate
# @author Thiago Coutinho<thiago @ osfeio.com>(selialkile)
# @note This code folow de "THE BEER-WARE LICENSE"
module Sieve
  class Filter

    # Initialize the class
    # @param [string] string of rule text
    # @return [object] Object of self
    def initialize(text_rule=nil)
      @text_rule = text_rule
      parse unless @text_rule.nil?
    end

    # Return the conditions of filter
    #@return [array] conditions
    def conditions
      @conditions
    end

    # Return the actions of filter
    #@return [array] actions
    def actions
      @actions
    end

    # Return name of filter
    # @return [string] name of filter
    def name
      @name
    end

    def add_condition(condition)
      @conditions << condition
    end

    def parse
      regex_rules_params = "(^#.*)\nif([\s\w\:\"\.\;\(\)\,]+)\{([\s\@\<>=a-zA-Z0-9\s\:\[\]\_\:\"\.\;\(\)\,\-\/]+)\}$"
      regex_rules_params2 = "(^#.*)\nif(.+)\n\{\n([\s\S]*)\}"
    end
  end

  # This class contains the attributes of conditions/tests 
  class Condition
    attr_accessor :test,:not,:arg1,:arg2,:type
  end

  # This class contains the attributes of action 
  class Action
    attr_accessor :type, :copy, :target
  end
end