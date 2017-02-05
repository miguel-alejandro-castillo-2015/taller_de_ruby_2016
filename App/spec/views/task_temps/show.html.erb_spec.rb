require 'rails_helper'

RSpec.describe "task_temps/show", type: :view do
  before(:each) do
    @task_temp = assign(:task_temp, TaskTemp.create!(
      :porcentaje_avance => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
