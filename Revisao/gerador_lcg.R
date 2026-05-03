set.seed(123)

LCG <- function(seed, a, c, M, n){
    x = seed
    result = c(x)
    for (dummy in 1:n){
        number = (a * x + c) %% M
        result = append(result, number / M)
        x = number
    }
    return(result)
}

scaleNumbers <- function(numbers, min, max){
    scaled_numbers = c()
    for(number in numbers){
        scaled_numbers = append(scaled_numbers, number * (max - min) + min)
    }
    return(scaled_numbers)
}

random_numbers = LCG(1, 6, 0, 11, 11)
random_numbers = scaleNumbers(random_numbers, 0, 10)
cat(random_numbers)