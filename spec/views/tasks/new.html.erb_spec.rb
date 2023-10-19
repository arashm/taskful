# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks/new' do
  before do
    assign(:task, Task.new(
                    title: 'MyString',
                    description: 'MyString',
                    user: nil,
                    status: 'MyString'
                  ))
  end

  it 'renders new task form' do
    render

    assert_select 'form[action=?][method=?]', tasks_path, 'post' do
      assert_select 'input[name=?]', 'task[title]'

      assert_select 'input[name=?]', 'task[description]'

      assert_select 'input[name=?]', 'task[user_id]'

      assert_select 'input[name=?]', 'task[status]'
    end
  end
end
