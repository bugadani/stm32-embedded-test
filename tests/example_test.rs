#![no_std]
#![no_main]

#[cfg(test)]
#[embedded_test::tests]
mod test {
    use defmt_rtt as _;

    #[init]
    fn init() -> () {
        let _p = embassy_stm32::init(Default::default());
    }

    #[test]
    fn test() {
        assert_eq!(1 + 1, 2);
    }
}
