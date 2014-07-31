require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  
  context "get method" do
  	it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the locations into @locations" do
      location1, location2 = create(:location), create(:location)
      get :index
      expect(assigns(:locations)).to match_array([location1, location2])
    end
  end
  
  context "show method" do
    it "renders the show template" do
      location = create(:location)
      get :show, id: location.id
      expect(response).to render_template("show")
    end

    it "responds successfully with an HTTP 200 status code" do
      location = create(:location)
      get :show, id: location.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads the location into @location" do
      location = create(:location)
      get :show, id: location.id
      expect(assigns(:location)).to eq(location)
    end
    it "receives status 404 error - not found" do
    	location = create(:location)
      get :show, id: 100
      expect(response.status).to eq(404)
    end
  end
  
  context "edit method" do
    it "renders the edit template" do
      location = create(:location)
      get :edit, id: location.id
      expect(response).to render_template("edit")
    end

    it "responds successfully with an HTTP 200 status code" do
      location = create(:location)
      get :edit, id: location.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads the location into @location" do
      location = create(:location)
      get :edit, id: location.id
      expect(assigns(:location)).to eq(location)
    end
  end
  
  context "update method" do
    it "renders the update template for specific location" do
      location = create(:location)
      patch :update, id: location.id, location: attributes_for(:location)
      expect(response).to redirect_to(action: 'show')
    end

    it "loads the location into @location" do
      location = create(:location)
      patch :update, id: location.id, location: attributes_for(:location)
      expect(assigns(:location)).to eq(location)
    end

    it "should update information changed" do
      location = create(:location)
      patch :update, id: location.id, location: attributes_for(:location, name: 'Gaudi')
      location.reload
      expect(location.name).to eq('Gaudi')
    end

    it "should not update with wrong information" do
      location = create(:location)
      patch :update, id: location.id, location: attributes_for(:location, name: 'Gaud!')
      location.reload
      expect(location.name).to eq('Favorite')
    end

    it "renders the update template for specific location" do
      location = create(:location)
      patch :update, id: location.id, location: attributes_for(:location, name: 'Gaud!')
      location.reload
      expect(response).to render_template('edit')
    end
  end

  context "new method" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
  
  context "create method" do
    it "render the show template after creating a location" do
      location = build(:location)
      post :create, location: attributes_for(:location)
      expect(response).to redirect_to(action: 'index')
    end

    it "make a new location" do
      location = build(:location)
      expect{post :create, location: attributes_for(:location)}.to change(Location,:count).by(1)
    end

    it "should not create new entry with wrong information" do
      location = build(:location)
      expect{post :create, location: attributes_for(:location, name: 'Gaud!')}.to_not change(Location,:count)
    end

    it "should not create new entry with wrong information" do
      location = build(:location)
      post :create, location: attributes_for(:location, name: 'Gaud!')
      expect(response).to render_template('new')
    end

  end
end
