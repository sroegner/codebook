require File.dirname(__FILE__) + '/../spec_helper'

describe CodeDocument, "the codebook document" do

  before(:each) do
    @doc = mock_model(CodeDocument, :title => "Example Doc", :id => 10)
  end

  it "should be happy" do
    @doc.should_not be nil
  end

end
