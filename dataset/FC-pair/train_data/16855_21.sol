contract c16855{
    /**
     * Calculates exchange amount for ETH to token.
     *
     * @param amountETH Amount of ETH, in base units
     */
    function calculateAmountForETH(uint256 amountETH) public view returns (uint256) {
        return Rationals.rmul(amountETH, ethRate);
    }
}