contract c7960{
    /**
     * @dev We validate the new amount doesn't surpass maximum contribution cap
     */
    function handleTokens(address _address, uint256 _tokens) internal {
        require(individualMaxCapTokens == 0 || token.balanceOf(_address).plus(_tokens) <= individualMaxCapTokens);
        super.handleTokens(_address, _tokens);
    }
}