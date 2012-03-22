require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CardsProfilesController do

  # This should return the minimal set of attributes required to create a valid
  # CardsProfile. As you add validations to CardsProfile, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all cards_profiles as @cards_profiles" do
      cards_profile = CardsProfile.create! valid_attributes
      get :index
      assigns(:cards_profiles).should eq([cards_profile])
    end
  end

  describe "GET show" do
    it "assigns the requested cards_profile as @cards_profile" do
      cards_profile = CardsProfile.create! valid_attributes
      get :show, :id => cards_profile.id
      assigns(:cards_profile).should eq(cards_profile)
    end
  end

  describe "GET new" do
    it "assigns a new cards_profile as @cards_profile" do
      get :new
      assigns(:cards_profile).should be_a_new(CardsProfile)
    end
  end

  describe "GET edit" do
    it "assigns the requested cards_profile as @cards_profile" do
      cards_profile = CardsProfile.create! valid_attributes
      get :edit, :id => cards_profile.id
      assigns(:cards_profile).should eq(cards_profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CardsProfile" do
        expect {
          post :create, :cards_profile => valid_attributes
        }.to change(CardsProfile, :count).by(1)
      end

      it "assigns a newly created cards_profile as @cards_profile" do
        post :create, :cards_profile => valid_attributes
        assigns(:cards_profile).should be_a(CardsProfile)
        assigns(:cards_profile).should be_persisted
      end

      it "redirects to the created cards_profile" do
        post :create, :cards_profile => valid_attributes
        response.should redirect_to(CardsProfile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cards_profile as @cards_profile" do
        # Trigger the behavior that occurs when invalid params are submitted
        CardsProfile.any_instance.stub(:save).and_return(false)
        post :create, :cards_profile => {}
        assigns(:cards_profile).should be_a_new(CardsProfile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CardsProfile.any_instance.stub(:save).and_return(false)
        post :create, :cards_profile => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cards_profile" do
        cards_profile = CardsProfile.create! valid_attributes
        # Assuming there are no other cards_profiles in the database, this
        # specifies that the CardsProfile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CardsProfile.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => cards_profile.id, :cards_profile => {'these' => 'params'}
      end

      it "assigns the requested cards_profile as @cards_profile" do
        cards_profile = CardsProfile.create! valid_attributes
        put :update, :id => cards_profile.id, :cards_profile => valid_attributes
        assigns(:cards_profile).should eq(cards_profile)
      end

      it "redirects to the cards_profile" do
        cards_profile = CardsProfile.create! valid_attributes
        put :update, :id => cards_profile.id, :cards_profile => valid_attributes
        response.should redirect_to(cards_profile)
      end
    end

    describe "with invalid params" do
      it "assigns the cards_profile as @cards_profile" do
        cards_profile = CardsProfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CardsProfile.any_instance.stub(:save).and_return(false)
        put :update, :id => cards_profile.id, :cards_profile => {}
        assigns(:cards_profile).should eq(cards_profile)
      end

      it "re-renders the 'edit' template" do
        cards_profile = CardsProfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CardsProfile.any_instance.stub(:save).and_return(false)
        put :update, :id => cards_profile.id, :cards_profile => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cards_profile" do
      cards_profile = CardsProfile.create! valid_attributes
      expect {
        delete :destroy, :id => cards_profile.id
      }.to change(CardsProfile, :count).by(-1)
    end

    it "redirects to the cards_profiles list" do
      cards_profile = CardsProfile.create! valid_attributes
      delete :destroy, :id => cards_profile.id
      response.should redirect_to(cards_profiles_url)
    end
  end

end