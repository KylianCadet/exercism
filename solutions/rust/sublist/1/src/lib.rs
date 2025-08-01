#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn is_contained<T: PartialEq>(a: &[T], b: &[T]) -> bool {
    if a == b {
        return true;
    }
    for i in 0..a.len() {
        if a[i..].starts_with(b) {
            return true;
        }
    }
    return false;
}

pub fn sublist<T: PartialEq>(a: &[T], b: &[T]) -> Comparison {
    let c1 = is_contained(a, b);
    let c2 = is_contained(b, a);

    match (c1, c2) {
        (true, true) => Comparison::Equal,
        (false, false) => Comparison::Unequal,
        (true, false) => Comparison::Superlist,
        (false, true) => Comparison::Sublist,
    }
}
