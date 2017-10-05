# encoding: utf-8
require 'spec_helper'

describe 'file input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything

    concat(semantic_form_for(@new_post) do |builder|
      concat(builder.input(:body, :as => :file))
    end)
  end

  it 'has expected DOM structure' do
    output_buffer.should have_tag('label.label') # this was actually present in formtastic-bootstrap, who are we to disallow it?
    output_buffer.should have_tag('form div.form-group label.control-label', :count => 1)
  end

end
