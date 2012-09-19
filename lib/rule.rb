# -*- coding: UTF-8 -*-

# This class implements a parse of sieve rules and returns a object
# to manipulate
# @author Thiago Coutinho<thiago @ osfeio.com>(selialkile)
# @note This code folow de "THE BEER-WARE LICENSE"
module Managesieve
  class Rule

    # Initialize the class
    # @param [string] string of rule text
    # @return [object] Object of self
    def initialize(text_rule=nil)
      @text_rule = text_rule
      regex_requires = "/(^require\s\S+;$)/"
      # pra nao perder as regex xD
      regex_rules = "(^[#[a-zA-Z0-9\s\:\[\]\_]]*\nif[\s\w\:\"\.\;\(\)\,]*\n\{[a-zA-Z0-9\s\@\<>=\:\[\]\_\:\"\.\;\(\)\,\-\/]*\n\}$)"
      regex_rules_params = "(^#.*)\nif([\s\w\:\"\.\;\(\)\,]+)\{([\s\@\<>=a-zA-Z0-9\s\:\[\]\_\:\"\.\;\(\)\,\-\/]+)\}$"
      regex_rules_params2 = "(^#.*)\nif(.+)\n\{\n([\s\S]*)\}"
    end

    def conditions
      @conditions
    end

    def name
      @name
    end

    def add_condition(condition)
      @conditions << condition
    end


  end
end