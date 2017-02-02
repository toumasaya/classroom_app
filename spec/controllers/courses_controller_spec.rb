require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "Get index" do
    it "assigns @courses" do
      course1 = create(:course)
      course2 = create(:course)

      get :index
      expect(assigns[:courses]).to eq([course1, course2])
    end

    it "render template" do
      course1 = create(:course)
      course2 = create(:course)

      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Get show" do
    it "assigns @course" do
      course = create(:course)

      get :show, params: { id: course.id }
      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      course = create(:course)

      get :show, params: { id: course.id }
      expect(response).to render_template(:show)
    end
  end

  describe "Get new" do
    it "assign @course" do
      course = build(:course)

      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end

    it "render template" do
      course = build(:course)

      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Post create" do
    context "When course doesn't have a title" do
      it "doesn't create a record" do
        expect do
          post :create, params: { course: { description: "bar" } }
        end.to change { Course.count }.by(0)
      end

      it "render new template" do
        post :create, params: { course: { description: "bar" } }
        expect(response).to render_template(:new)
      end
    end

    context "When course has a title" do
      it "create a new course record" do
        expect do
          post :create, params: { course: attributes_for(:course) }
        end.to change { Course.count }.by(1)
      end

      it "redirect to courses_path" do
        course = build(:course)
        post :create, params: { course: attributes_for(:course) }
        expect(response).to redirect_to(courses_path)
      end
    end
  end
end
