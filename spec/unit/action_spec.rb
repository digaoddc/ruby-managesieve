# -*- encoding : utf-8 -*-
require 'spec_helper'

module Sieve
  describe Action do
    let(:actions_text) {  [ 
      %q{fileinto :copy "INBOX.rascunho";},
      %q{redirect :copy "lala@teste.com";},
      %q{discard;},
      %q{stop;}
    ]}

    context "given a success with type 'fileinto'" do
      subject{Sieve::Action.new(actions_text[0])}

      it 'should have a type' do
        subject.type.should == "fileinto"
      end

      it "should have copy" do
        subject.copy.should == "copy"
      end

      it "should have target" do
        subject.target.should == "INBOX.rascunho"
      end
    end

    context "given a success with type 'redirect'" do
      subject{Sieve::Action.new(actions_text[1])}

      it 'should have a type' do
        subject.type.should == "redirect"
      end

      it "should have copy" do
        subject.copy.should == "copy"
      end

      it "should have target" do
        subject.target.should == "lala@teste.com"
      end
    end

    context "given a success with type 'discart'" do
      subject{Sieve::Action.new(actions_text[2])}

      it 'should have a type' do
        subject.type.should == "discart"
      end

      it "should have copy" do
        subject.copy.should == nil
      end

      it "should have target" do
        subject.target.should == nil
      end
    end

    context "given a success with type 'stop'" do
      subject{Sieve::Action.new(actions_text[3])}

      it 'should have a type' do
        subject.type.should == "stop"
      end

      it "should have copy" do
        subject.copy.should == nil
      end

      it "should have target" do
        subject.target.should == nil
      end
    end

    context "given a failure" do
    end
  end
end