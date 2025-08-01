const ADJACENT_CASES: [(isize, isize); 8] = [
    (-1, -1),
    (-1, 0),
    (-1, 1),
    (0, -1),
    (0, 1),
    (1, -1),
    (1, 0),
    (1, 1),
];

fn calc_adjacent_mines(minefield: &[&str], j: usize, i: usize) -> char {
    let adjacent_mines_count: u8 = ADJACENT_CASES
        .iter()
        .map(|(x, y)| {
            match minefield
                .iter()
                .nth(j.overflowing_add_signed(*x).0)
                .unwrap_or(&"")
                .chars()
                .nth(i.overflowing_add_signed(*y).0)
            {
                Some('*') => 1,
                _ => 0,
            }
        })
        .sum();
    match adjacent_mines_count {
        x if x > 0 => x.to_string().chars().next().unwrap_or('E'),
        _ => ' ',
    }
}

pub fn annotate(minefield: &[&str]) -> Vec<String> {
    minefield
        .iter()
        .enumerate()
        .fold(vec![], |mut acc: Vec<String>, (j, row)| {
            let new_row = row
                .chars()
                .enumerate()
                .map(|(i, c)| match c {
                    ' ' => calc_adjacent_mines(minefield, j, i),
                    _ => c,
                })
                .collect::<String>();
            acc.push(new_row);
            acc
        })
}
