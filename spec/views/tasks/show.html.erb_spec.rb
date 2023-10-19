# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/show' do
  before do
    assign(:task, Task.create!(
                    title: 'Title',
                    description: 'Description',
                    user: nil,
                    status: 'Status'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
  end
end
