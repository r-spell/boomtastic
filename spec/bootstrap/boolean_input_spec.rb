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

  it 'loads file' do
    expect(true).to be(true)
  end


  it 'has a working output buffer, yo yo' do
    output_buffer.should_not have_tag('label.label')
    output_buffer.should have_tag('form div.form-group label.control-label', :count => 1)
  end

end
