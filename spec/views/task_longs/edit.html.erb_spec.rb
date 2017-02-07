require 'rails_helper'

RSpec.describe "task_longs/edit", type: :view do
  before(:each) do
    @task_long = assign(:task_long, TaskLong.create!())
  end

  it "renders the edit task_long form" do
    render

    assert_select "form[action=?][method=?]", task_long_path(@task_long), "post" do
    end
  end
end
