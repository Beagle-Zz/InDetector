contract c16666{
   /**
    *   @dev Function to set current token price
    *   @param _numerator       human token per usd numerator
    *   @param _denominator     human token per usd denominator
    */
    function setPrice(uint _numerator, uint _denominator) external onlyOracle {
        tokenPerUsdNumerator = _numerator;
        tokenPerUsdDenominator = _denominator;
    }
}