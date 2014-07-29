require 'rails_helper'

RSpec.describe VisitsController, :type => :controller do

	it "renders the visits template" do
		location = Location.create(:name => "Beach", :city => "Barcelona")
    get :index, location_id: location.id
    expect(response).to render_template("index")
  end

  it "receives status 200 successful" do #testing response of URL status = 200 successful
    location = Location.create(:name => "Beach", :city => "Barcelona")
  	visit = Visit.create(location_id: location.id, user_id: 1, from_date: Date.today, to_date: Date.today+5)
    get :show, {'location_id' => location.id, 'id' => visit.id}
    expect(response.status).to eq(200)
  end

  it "renders the show template with a specific id" do #testing if HTML file rendering on the page
  	location = Location.create(:name => "Beach", :city => "Barcelona")
  	visit = Visit.create(location_id: location.id, user_id: 1, from_date: Date.today, to_date: Date.today+5)
    get :show, {'location_id' => location.id, 'id' => visit.id}
    expect(response).to render_template(:show)
  end

  it "assigns to @visit" do
  	location = Location.create(:name => "Beach", :city => "Barcelona")
  	visit = Visit.create(location_id: location.id, user_id: 1, from_date: Date.today, to_date: Date.today+5)
    get :show, {'location_id' => location.id, 'id' => visit.id}
    expect(assigns(:visit)).to eq visit
  end

  it "receives status 404 error - not found" do
    location = Location.create(:name => "Beach", :city => "Barcelona")
  	visit = Visit.create(location_id: location.id, user_id: 1, from_date: Date.today, to_date: Date.today+5)
    get :show, {'location_id' => location.id, 'id' => 100}
    expect(response.status).to eq(404)
  end

end
