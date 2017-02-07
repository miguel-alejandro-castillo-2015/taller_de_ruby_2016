require 'rails_helper'

RSpec.describe "task_temps/edit", type: :view do
  before(:each) do
    @task_temp = assign(:task_temp, TaskTemp.create!(
      :porcentaje_avance => 1
    ))
  end

  it "renders the edit task_temp form" do
    render

    assert_select "form[action=?][method=?]", task_temp_path(@task_temp), "post" do

      assert_select "input#task_temp_porcentaje_avance[name=?]", "task_temp[porcentaje_avance]"
    end
  end
end
