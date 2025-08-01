pub fn factors(n: u64) -> Vec<u64> {
    let mut rest = n;
    let mut answer: Vec<u64> = vec![];
    let mut divisor = 2;

    while rest != 1 {
        if rest % divisor == 0 {
            answer.push(divisor);
            rest /= divisor
        } else {
            divisor += 1;
        }
    }

    answer
}
