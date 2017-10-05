# encoding: utf-8
require 'spec_helper'

describe 'string input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe "when object is provided" do
    before do
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:title, :as => :string))
      end)
    end

    it 'has expected DOM structure' do
      output_buffer.should_not have_tag('label.label')
      output_buffer.should have_tag('form div.form-group label.control-label', :count => 1)
      output_buffer.should have_tag('form div.string.form-group input.form-control', :count => 1)
    end
  end
end
