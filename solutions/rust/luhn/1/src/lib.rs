/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let count_without_whitespace = code.chars().filter(|c| !c.is_whitespace()).count();

    if count_without_whitespace < 2
        || code
            .chars()
            .any(|c| !c.is_ascii_digit() && !c.is_whitespace())
    {
        return false;
    }

    let parity = count_without_whitespace % 2;

    code.chars()
        .filter(|c| !c.is_whitespace())
        .map(|c| c.to_digit(10).unwrap())
        .enumerate()
        .map(|(i, v)| match i % 2 {
            x if x != parity => v,
            x if x == parity && v > 4 => v * 2 - 9,
            _ => v * 2,
        })
        .sum::<u32>()
        % 10
        == 0
}
