contract c16855{
    /**
     * Calculates exchange amount for DAI to token.
     *
     * @param amountDAI Amount of DAI, in base units
     */
    function calculateAmountForDAI(uint256 amountDAI) public view returns (uint256) {
        return Rationals.rmul(amountDAI, daiRate);
    }
}