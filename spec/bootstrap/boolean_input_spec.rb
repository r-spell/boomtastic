# encoding: utf-8
require 'spec_helper'

describe 'boolean input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything

    concat(semantic_form_for(@new_post) do |builder|
      concat(builder.input(:allow_comments, :as => :boolean))
    end)
  end


  it 'has expected DOM structure' do
    output_buffer.should_not have_tag('label.label')
    output_buffer.should have_tag('form label.control-label', :count => 1)
  end

end
