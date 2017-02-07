require 'rails_helper'

RSpec.describe "task_longs/show", type: :view do
  before(:each) do
    @task_long = assign(:task_long, TaskLong.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
