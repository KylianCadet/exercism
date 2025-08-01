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

macro_rules! impl_Planet {
    ( $( $p:ty, $period:expr ),* ) => {
        $(impl Planet for $p {
            fn get_period() -> f64 {
                $period
            }
        })*
    };
}

impl_Planet!(Mercury, 0.2408467);
impl_Planet!(Venus, 0.61519726);
impl_Planet!(Earth, 1.0);
impl_Planet!(Mars, 1.8808158);
impl_Planet!(Jupiter, 11.862615);
impl_Planet!(Saturn, 29.447498);
impl_Planet!(Uranus, 84.016846);
impl_Planet!(Neptune, 164.79132);
