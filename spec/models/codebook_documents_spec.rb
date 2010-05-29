require File.dirname(__FILE__) + '/../spec_helper'

describe CodeDocument, "the codebook document" do

  it "should be happy" do
    @doc = Factory.build(:code_document)
    @doc.should_not be(nil)
  end

  it "should be unique" do
    cd = CodeDocument.create(:title => "abc", :author_id => 1, :code_language_id => 1, :code_area_id => 1)
    CodeDocument.new(:title => "abc", :author_id => 1, :code_language_id => 1, :code_area_id => 1).should_not be_valid
    cd.destroy()
  end

  it "should be invalid without a title" do
    CodeDocument.new(:title => nil).should_not be_valid
  end

  it "should not be valid with an too long title" do
    CodeDocument.new(:title => "a"*61).should_not be_valid
  end

  it "should not be valid without an author" do
    CodeDocument.new(:title => "abc").should_not be_valid
  end

  it "should not be valid without a language or area" do
    CodeDocument.new(:title => "abc", :author_id => 1).should_not be_valid
    CodeDocument.new(:title => "abc", :author_id => 1, :code_area_id => 1).should_not be_valid
    CodeDocument.new(:title => "abc", :author_id => 1, :code_language_id => 1).should_not be_valid
  end


end
