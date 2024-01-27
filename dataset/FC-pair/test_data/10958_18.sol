contract c10958{
    /*
     * @dev calculate amount
     * @return token amount that we should send to our dear investor
     */
    function calcAmount() internal returns (uint256) {
        // get ammount in wei
        uint256 weiAmount = msg.value;
        // calculate token amount to be created
        uint256 tokens = weiAmount.mul(rate);
        return tokens;
    }
}