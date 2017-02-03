require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe "GET index" do
    let(:course1) { create(:course) }
    let(:course2) { create(:course) }
    before { get :index }

    it "assigns @courses" do
      expect(assigns[:courses]).to eq([course1, course2])
    end

    it "render template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    let(:course) { create(:course) }
    before { get :show, params: { id: course.id } }

    it "assigns @course" do
      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    context "When user login" do
      let(:user) { create(:user) }
      let(:course) { build(:course) }
      before do
        sign_in user
        get :new
      end

      it "assign @course" do
        expect(assigns(:course)).to be_a_new(Course)
      end

      it "render template" do
        expect(response).to render_template(:new)
      end
    end

    context "When user not login" do
      it "redirect to new_user_session_path" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end


  end

  describe "POST create" do
    let(:user) { create(:user) }
    before { sign_in user }

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

      it "creates course for user" do
        course = build(:course)
        post :create, params: { course: attributes_for(:course) }
        expect(Course.last.user).to eq(user)
      end
    end
  end

  describe "GET edit" do
    let(:course) { create(:course) }
    before { get :edit, params: { id: course.id } }

    it "assign course" do
      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    let(:course) { create(:course) }

    context "When course doesn't have a title" do
      before { put :update, params: { id: course.id, course: { title: "", description: "description" } } }

      it "doesn't update a record" do
        expect(course.description).not_to eq("description")
      end

      it "render edit template" do
        expect(response).to render_template(:edit)
      end
    end

    context "When course has a title" do
      before { put :update, params: { id: course.id, course: { title: "Title", description: "description" } } }

      it "assign @course" do
        expect(assigns[:course]).to eq(course)
      end

      it "change value" do
        expect(assigns[:course].title).to eq("Title")
        expect(assigns[:course].description).to eq("description")
      end

      it "redirect to course_path" do
        expect(response).to redirect_to(course_path(course))
      end
    end
  end

  describe "DELETE destroy" do
    it "assign @course" do
      course = create(:course)
      delete :destroy, params: { id: course.id }
      expect(assigns[:course]).to eq(course)
    end

    it "delete a record" do
      course = create(:course)
      expect { delete :destroy, params: { id: course.id } }.to change { Course.count }.by(-1)
    end

    it "redirect to courses_path" do
      course = create(:course)
      delete :destroy, params: { id: course.id }
      expect(response).to redirect_to courses_path
    end
  end
end
