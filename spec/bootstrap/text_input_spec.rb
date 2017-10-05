# encoding: utf-8
require 'spec_helper'

describe 'text input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything

    concat(semantic_form_for(@new_post) do |builder|
      concat(builder.input(:body, :as => :text))
    end)
  end

  it 'has expected DOM structure' do
    output_buffer.should_not have_tag('label.label')
    output_buffer.should have_tag('form div.form-group label.control-label', :count => 1)
    output_buffer.should have_tag('form div.form-group.text textarea.form-control', :count => 1)
  end

end

