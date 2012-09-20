# -*- coding: UTF-8 -*-

# This class implements a parse of sieve and returns a object
# to manipulate
# ONLY ACCEPTY THE "IF" conditions
#@see http://www.faqs.org/rfcs/rfc3028.html
#@see http://www.faqs.org/rfcs/rfc5804.html
#@see http://www.faqs.org/rfcs/rfc5230.html
#@see http://www.faqs.org/rfcs/rfc5229.html
# @author Thiago Coutinho<thiago @ osfeio.com>(selialkile)
# @note This code folow de "THE BEER-WARE LICENSE"
module Sieve
  class Parser
    def initialize(text_sieve=nil)
      @text_sieve = text_sieve
      parse unless @text_sieve.nil?
    end

    # Return all filters of script.
    #@return [array] array of filters
    def filters
      @filters
    end

    # Requires inside the script
    #@return [array] names of requires
    def requires
      @requires
    end

    # Make de parse and put results in variables
    def parse
      #return a array with string of elements: "xxxx", "yyyyyy"
      regex_requires = "^require\s\[(\S+)\];$"

      #return a array with string of filters
      regex_rules = "(^[#[a-zA-Z0-9\s\:\[\]\_]]*\nif[\s\w\:\"\.\;\(\)\,]*\n\{[a-zA-Z0-9\s\@\<>=\:\[\]\_\:\"\.\;\(\)\,\-\/]*\n\}$)"
    end
  end
end