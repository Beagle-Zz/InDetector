contract c13405{
    /// @notice Price of MET at nth minute out during operational auction
    /// @param initialPrice The starting price ie last purchase price
    /// @param _n The number of minutes passed since last purchase
    /// @return The resulting price
    function priceAt(uint initialPrice, uint _n) public view returns (uint price) {
        uint mult = METDECMULT;
        uint i;
        uint n = _n;
        /// If quotient of n/1000 is greater than 0 then calculate multiplier by
        /// multiplying thousandtimes and mult in a loop which runs quotient times.
        /// Also assign new value to n which is remainder of n/1000.
        if (n / 1000 > 0) {
            for (i = 0; i < n / 1000; i++) {
                mult = mult.mul(thousandtimes).div(METDECMULT);
            }
            n = n % 1000;
        }
        /// If quotient of n/100 is greater than 0 then calculate multiplier by
        /// multiplying hundredtimes and mult in a loop which runs quotient times.
        /// Also assign new value to n which is remainder of n/100.
        if (n / 100 > 0) {
            for (i = 0; i < n / 100; i++) {
                mult = mult.mul(hundredtimes).div(METDECMULT);
            }
            n = n % 100;
        }
        /// If quotient of n/10 is greater than 0 then calculate multiplier by
        /// multiplying tentimes and mult in a loop which runs quotient times.
        /// Also assign new value to n which is remainder of n/10.
        if (n / 10 > 0) {
            for (i = 0; i < n / 10; i++) {
                mult = mult.mul(tentimes).div(METDECMULT);
            }
            n = n % 10;
        }
        /// Calculate multiplier by multiplying 0.99 and mult, repeat it n times.
        for (i = 0; i < n; i++) {
            mult = mult.mul(99).div(100);
        }
        /// price is calculated as initialPrice multiplied by 0.99 and that too _n times.
        /// Here mult is METDECMULT multiplied by 0.99 and that too _n times.
        price = initialPrice.mul(mult).div(METDECMULT);
        if (price < minimumPriceInDailyAuction) {
            price = minimumPriceInDailyAuction;
        }
    }
}