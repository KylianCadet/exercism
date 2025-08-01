use core::fmt::{Display, Formatter};

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result<(), std::fmt::Error> {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl Clock {
    fn format(mut hours: i32, mut minutes: i32) -> (i32, i32) {
        while minutes >= 60 {
            minutes -= 60;
            hours += 1;
        }
        while minutes < 0 {
            minutes += 60;
            hours -= 1;
        }
        while hours < 0 {
            hours += 24;
        }
        hours %= 24;
        (hours, minutes)
    }

    pub fn new(hours: i32, minutes: i32) -> Self {
        let (hours, minutes) = Clock::format(hours, minutes);
        Clock { hours, minutes }
    }

    pub fn add_minutes(mut self, minutes: i32) -> Self {
        let (hours, minutes) = Clock::format(self.hours, self.minutes + minutes);
        self.hours = hours;
        self.minutes = minutes;
        self
    }
}
