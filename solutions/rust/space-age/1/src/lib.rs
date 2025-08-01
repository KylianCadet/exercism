// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

use std::ops::Div;

#[derive(Debug)]
pub struct Duration {
    s: f64,
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration { s: s as f64 }
    }
}

pub trait Planet {
    fn get_period() -> f64 {
        unimplemented!("get_period is not implemented")
    }

    fn years_during(d: &Duration) -> f64 {
        d.s.div(31557600.0 * Self::get_period())
    }
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
    fn get_period() -> f64 {
        0.2408467
    }
}
impl Planet for Venus {
    fn get_period() -> f64 {
        0.61519726
    }
}
impl Planet for Earth {
    fn get_period() -> f64 {
        1.0
    }
}
impl Planet for Mars {
    fn get_period() -> f64 {
        1.8808158
    }
}
impl Planet for Jupiter {
    fn get_period() -> f64 {
        11.862615
    }
}
impl Planet for Saturn {
    fn get_period() -> f64 {
        29.447498
    }
}
impl Planet for Uranus {
    fn get_period() -> f64 {
        84.016846
    }
}
impl Planet for Neptune {
    fn get_period() -> f64 {
        164.79132
    }
}
