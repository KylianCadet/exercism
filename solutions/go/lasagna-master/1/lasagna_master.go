package lasagnamaster

// TODO: define the 'PreparationTime()' function
func PreparationTime(layers []string, averagePrepTime int) int {
    if (averagePrepTime == 0) {
        averagePrepTime = 2
    }
    return len(layers) * averagePrepTime
}

// TODO: define the 'Quantities()' function
const NOODLE_PER_LAYER int = 50
const SAUCE_PER_LAYER float64 = 0.2

func Quantities(layers []string) (noddles int, sauce float64) {
    var noddleLayerCount int = 0
    var sauceLayerCount int = 0
    for _, v := range layers {
        if v == "noodles" {
            noddleLayerCount += 1
        }
    	if v == "sauce" {
            sauceLayerCount += 1
        }
    }
    noddles = noddleLayerCount * NOODLE_PER_LAYER
    sauce = float64(sauceLayerCount) * SAUCE_PER_LAYER
    return
}

// TODO: define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendsList []string, myList []string) {
    myList[len(myList) - 1] = friendsList[len(friendsList) - 1]
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(quantities []float64, portions int) []float64 {
    scaledQuantities := make([]float64, len(quantities))
    copy(scaledQuantities, quantities)
    for i, v := range quantities {
        scaledQuantities[i] = v / 2.0 * float64(portions)
    }
    return scaledQuantities
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
