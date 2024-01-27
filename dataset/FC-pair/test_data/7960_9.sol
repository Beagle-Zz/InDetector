contract c7960{
    /**
     * @dev this overridable function that calculates the tokens based on the ether amount
     */
    function calculateTokens(uint256 _amount) internal view returns(uint256 tokens) {
        tokens = _amount.mul(getConversionRate());
    }
}