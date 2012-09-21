# -*- coding: UTF-8 -*-
require 'pry'
# This class implements a parse of sieve filter and returns a object
# to manipulate
# @author Thiago Coutinho<thiago @ osfeio.com>(selialkile)
# @note This code folow de "THE BEER-WARE LICENSE"
module Sieve
  class Filter

    #@note [join] can be: any, allof or anyof
    attr_accessor :name, :type, :join
    # Initialize the class
    # @param [string] string of filter text
    # @return [object] Object of self
    def initialize(text_filter=nil)
      @text_filter = text_filter
      @conditions = []
      @actions = []
      parse unless @text_filter.nil?
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

    # Parse conditions, call the parse_common or parse_vacation
    def parse
      @text_filter[/vacation/].nil? ? parse_common : parse_vacation
    end

    private
    # Parse the filter adding contitions and actions to class
    def parse_common
      #regex_rules_params = "(^#.*)\nif([\s\w\:\"\.\;\(\)\,\-]+)\{([\@\<>=a-zA-Z0-9\s\[\]\_\:\"\.\;\(\)\,\-\/]+)\}$"
      #regex_rules_params2 = "(^#.*)\n(\S+)(.+)\n\{\n([\s\S]*)\}"
      parts = @text_filter.scan(/(^#.*)\n(\S+)\s(.+)\n\{\n([\s\S]*)\}/)[0]
      parse_name(parts[0])
      @type = parts[1]
      #if the join is true, dont have conditions...
      if parts[2] =~ /true/
        @conditions << Condition.new(type:"true")
      elsif parts[2] =~ /(anyof|allof)/
        @join = parts[2][/^\S+/]
        @conditions.concat(Condition.parse_all(parts[2]))
      else
        @conditions.concat(Condition.parse(parts[2]))
      end

      @actions.concat(Action.parse_all(parts[3]))
    end

    private
    # Parse the vacation filter
    def parse_vacation

    end

    def parse_name(text_name)
      @name = text_name.match(/#(.*)/)[1].strip
    end
  end

  class Vacation
    attr_accessor :days, :subject, :content
  end
end