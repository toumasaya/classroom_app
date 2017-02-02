require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "Get index" do
    it "assigns @courses and render template" do
      course1 = Course.create(title: "title_1", description: "content_1")
      course2 = Course.create(title: "title_2", description: "content_2")

      get :index

      expect(assigns[:courses]).to eq([course1, course2])
      expect(response).to render_template(:index)
    end
  end
end
