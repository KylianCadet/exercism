package birdwatcher

import "slices"

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) int {
    var sum int = 0
    for _, v := range birdsPerDay {
        sum += v
    }
	return sum
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
    i := 1
    for v := range slices.Chunk(birdsPerDay, 7) {
        if i == week {
            return TotalBirdCount(v)
        }
        i++
    }
    return 0
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
    for i, _ := range birdsPerDay {
        if i % 2 == 0 {
        	birdsPerDay[i] += 1
        }
    }
    return birdsPerDay
}
