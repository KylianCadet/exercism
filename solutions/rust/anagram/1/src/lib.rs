use std::collections::HashSet;

pub fn anagram(w1: &str, w2: &str) -> bool {
    w1.to_lowercase().chars().all(|c| {
        w2.to_lowercase().chars().filter(|&c2| c == c2).count()
            == w1.to_lowercase().chars().filter(|&c2| c == c2).count()
    }) && w1.len() == w2.len()
}

pub fn anagrams_for<'a>(word: &'a str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut hashset: HashSet<&str> = HashSet::new();

    possible_anagrams.iter().for_each(|s: &&str| {
        if anagram(s, word) && s.to_lowercase() != word.to_lowercase() {
            hashset.insert(*s);
        }
    });
    hashset
}
