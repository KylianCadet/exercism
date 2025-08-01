use std::collections::HashMap;
use std::sync::{Arc, Mutex};
use std::thread;

pub fn frequency(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    let frequency_map = Arc::new(Mutex::new(HashMap::new()));

    thread::scope(|s| {
        let mut handles = vec![];

        for chunk in input.chunks(worker_count) {
            let handle = s.spawn({
                let frequency_map = Arc::clone(&frequency_map);

                move || {
                    let mut local_map: HashMap<char, usize> = HashMap::new();
                    for &str_item in chunk {
                        for c in str_item.chars().filter(|c| c.is_alphabetic()) {
                            *local_map.entry(c.to_ascii_lowercase()).or_insert(0) += 1;
                        }
                    }

                    let mut shared_map = frequency_map.lock().unwrap();
                    for (letter, count) in local_map {
                        *shared_map.entry(letter).or_insert(0) += count;
                    }
                }
            });

            handles.push(handle);
        }

        for handle in handles {
            handle.join().unwrap();
        }
    });

    let value = frequency_map.lock().unwrap();
    value.clone()
}
