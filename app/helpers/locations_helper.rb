module LocationsHelper

  def display_location(location)
    location.city + "," + location.state + "," + location.country
  end
end
