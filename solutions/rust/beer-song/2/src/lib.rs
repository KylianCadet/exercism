fn get_bottle(n: u32) -> String {
    match n {
        1 => "1 bottle".to_string(),
        0 => "no more bottles".to_string(),
        _ => format!("{} bottles", n),
    }
}

fn remaining_bottle_action(n: u32) -> String {
    match n {
        1 => "Take it down and pass it around".to_string(),
        0 => "Go to the store and buy some more".to_string(),
        _ => "Take one down and pass it around".to_string(),
    }
}

fn uppercase_first_letter(mut s: String) -> String {
    s.remove(0).to_ascii_uppercase().to_string() + &s
}

pub fn verse(n: u32) -> String {
    format!(
        "{} of beer on the wall, {} of beer.\n{}, {} of beer on the wall.\n",
        uppercase_first_letter(get_bottle(n)),
        get_bottle(n),
        remaining_bottle_action(n),
        get_bottle(n.checked_sub(1).unwrap_or(99))
    )
}

pub fn sing(start: u32, end: u32) -> String {
    (end..start + 1)
        .rev()
        .map(|x| verse(x))
        .collect::<Vec<_>>()
        .join("\n")
}
