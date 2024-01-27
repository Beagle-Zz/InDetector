contract c13402{
    /// @notice Pricer constructor, calculate 10, 100 and 1000 times of 0.99.
    function initPricer() public {
        uint x = METDECMULT;
        uint i;
        /// Calculate 10 times of 0.99
        for (i = 0; i < 10; i++) {
            x = x.mul(99).div(100);
        }
        tentimes = x;
        x = METDECMULT;
        /// Calculate 100 times of 0.99 using tentimes calculated above.
        /// tentimes has 18 decimal places and due to this METDECMLT is
        /// used as divisor.
        for (i = 0; i < 10; i++) {
            x = x.mul(tentimes).div(METDECMULT);
        }
        hundredtimes = x;
        x = METDECMULT;
        /// Calculate 1000 times of 0.99 using hundredtimes calculated above.
        /// hundredtimes has 18 decimal places and due to this METDECMULT is
        /// used as divisor.
        for (i = 0; i < 10; i++) {
            x = x.mul(hundredtimes).div(METDECMULT);
        }
        thousandtimes = x;
    }
}