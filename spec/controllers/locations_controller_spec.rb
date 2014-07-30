require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  describe "get method" do
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
  describe "show method" do
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
  end
  
  # it "receives status 200 successful" do #testing response of URL status = 200 successful
  # 	location = Location.create(:id => 1, :name => "Beach", :city => "Barcelona")
  #   get :show, id: location.id
  #   expect(response.status).to eq(200)
  # end

  # it "renders the show template with a specific id" do #testing if HTML file rendering on the page
  # 	location = Location.create(:id => 1, :name => "Beach", :city => "Barcelona")
  #   get(:show, {'id' => "1"})
  #   expect(response).to render_template(:show)
  # end

  # it "assigns to @location" do
  # 	location = Location.create(:id => 1, :name => "Beach", :city => "Barcelona")
  #   get(:show, {'id' => "1"})
  #   expect(assigns(:location)).to eq location #assigns to instance variable @location in controller
  # end

  it "receives status 404 error - not found" do
  	location = Location.create(:id => 1, :name => "Beach", :city => "Barcelona")
    get(:show, {'id' => "100"})
    expect(response.status).to eq(404)
  end

end
