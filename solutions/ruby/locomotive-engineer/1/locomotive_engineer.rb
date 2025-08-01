class LocomotiveEngineer
  def self.generate_list_of_wagons(*args)
    args
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    each_wagons_id.append(*each_wagons_id.shift(2)).insert(1, *missing_wagons)
  end

  def self.add_missing_stops(location, **stops)
    {**location, stops: stops.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route,**more_route_information}
  end
end
