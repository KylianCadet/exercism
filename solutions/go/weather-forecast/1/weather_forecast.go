// Package weather provides tool to get weather forecast.
package weather

var (
    // CurrentCondition represents the current weather condition.
	CurrentCondition string
    // CurrentLocation represents the current weather location.
	CurrentLocation  string
)

// Forecast returns a string value representing the forecast weather based on the current location and current location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
