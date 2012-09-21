# -*- encoding : utf-8 -*-
require 'spec_helper'

module Sieve
  describe Filter do
    let(:filter_text_anyof){
%q{# rule:[nome_all]
if anyof (header :contains "From" "all", header :contains "aaaaa" "333")
{
    fileinto :copy "INBOX.lixo";
    redirect "eduardo.lipolis@locaweb.com.br";
}
}
    }
    let(:filter_text_allof){
%q{# rule:[nome all rules]
if allof (header :contains "Subject" "asdf", header :contains "From" "vvvvv", header :contains "To" "vvvvv")
{
    fileinto :copy "INBOX.rascunho";
    stop;
}
}
    }

    before(:each) do
      Condition.stub(:parse_all).and_return([
        Condition.new(:type=>"header", :type => ":contains"), 
        Condition.new(:type=>"header", :type => ":contains")
      ])
      Action.stub(:parse_all).and_return([
        Action.new(:type=>"fileinto",:copy=>"copy",:target=>"INBOX.rascunho"),
        Action.new(:type=>"fileinto",:target=>"INBOX.rascunho"),
      ])
    end
    context "given a success with type anyof" do
      subject{Sieve::Filter.new(filter_text_anyof)}

      it 'should have a name' do
        subject.name.should == "rule:[nome_all]"
      end

      it "should have conditions" do
        subject.conditions.count.should == 2
      end

      it "should have actions" do
        subject.actions.count.should == 2
      end
    end

    context "given a success with type allof" do
      subject{Sieve::Filter.new(filter_text_allof)}

      it 'should have a name' do
        subject.name.should == "rule:[nome all rules]"
      end

      it "should have conditions" do
        subject.conditions.count.should == 2
      end

      it "should have actions" do
        subject.actions.count.should == 2
      end
    end

    context "given a failure" do
    end
  end
end