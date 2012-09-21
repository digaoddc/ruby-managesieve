# -*- encoding : utf-8 -*-
require 'spec_helper'

module Sieve
  describe Condition do
        
    let(:conditions_text) {  [ 
        %q{header :contains "Subject" "teste"} ,
        %q{anyof (header :contains "Subject" "lala", not header :contains "Subject" "popo", header :count "gt" :comparator "i;ascii-numeric" "Subject" "4", not exists "Subject", exists "Subject", header :count "ge" :comparator "i;ascii-numeric" "Subject" "2")} ,
        %q{anyof (header :contains "From" "all", header :contains "aaaaa" "333")} ,
        %q{allof (header :contains "Subject" "asdf", header :contains "From" "vvvvv", header :contains "To" "vvvvv")} ,
        %q{true} 
    ]}

    context "given a success with one condition" do
      subject{Sieve::Condition.new(conditions_text[0])}

      it 'should have a test attribute' do
        subject.type.should == "fileinto"
      end

      it "dont should have not" do
        subject.not.should == nil
      end

      it "should have target" do
        subject.target.should == "INBOX.rascunho"
      end
    end

  end
end