
class SpaceAge
  PLANETS = [
    {:name => 'mercury',:period => 0.2408467},
    {:name => 'venus',:period => 0.61519726},
    {:name => 'earth',:period => 1.0},
    {:name => 'mars',:period => 1.8808158},
    {:name => 'jupiter',:period => 11.862615},
    {:name => 'saturn',:period => 29.447498},
    {:name => 'uranus',:period => 84.016846},
    {:name => 'neptune',:period => 164.79132},
  ].freeze

  SECONDS_IN_EARTH_YEAR = 31557600.0

  PLANETS.each {|planet|
    define_method("on_#{planet[:name]}") {
      @second / SECONDS_IN_EARTH_YEAR / planet[:period]
    }
  }

  def initialize(second)
    @second = second
  end
end