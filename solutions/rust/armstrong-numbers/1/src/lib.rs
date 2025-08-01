fn calc_armstrong_number(num: u32) -> Result<u32, ()> {
    let l = num.to_string().len() as u32;

    num.to_string()
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .map(|i| i.pow(l))
        .try_fold(0, |acc: u32, i| acc.checked_add(i).ok_or(()))
}

pub fn is_armstrong_number(num: u32) -> bool {
    match calc_armstrong_number(num) {
        Ok(armstrong_number) => armstrong_number == num,
        Err(_) => false,
    }
}
