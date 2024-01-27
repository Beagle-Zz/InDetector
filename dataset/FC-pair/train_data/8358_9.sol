contract c8358{
    /**
     * @dev Default transferable tokens function returns all tokens for a holder (no limit).
     * @dev Overwriting transferableTokens(address holder, uint time, uint number) is the way to provide the 
     * specific logic for limiting token transferability for a holder over time or number.
     */
    function transferableTokens(address holder, uint /* time */, uint /* number */) view public returns (uint256) {
        return balanceOf(holder);
    }
}