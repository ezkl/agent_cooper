require 'spec_helper'

describe AgentCooper::Response do

  subject { described_class.new(:response => response) }

  let(:body) { "<root><foo>bar</foo></root>" }
  let(:code) { 200 }

  let(:response) { mock(:response, :body => body, :code => code) }

  its(:body)    { should eql(body) }
  its(:code)    { should eql(code) }

  its(:to_hash) { should eql({"root" => {"foo" => "bar"}}) }

  context "when options are passed" do
    specify "preserve_attributes" do
      subject.to_hash(:preserve_attributes => true).should eql({"root" => {"foo" => {"__content__" => "bar"}}})
    end
  end

  its(:xml)     { should be_a(Nokogiri::XML::Document) }
  its(:valid?)  { should be_true }

  context "when code != 200" do
    let(:code) { 400 }
    its(:valid?) { should be_false }
  end

end
