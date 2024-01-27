contract c7960{
    /**
     * @dev Mint the specific amount tokens
     */
    function handleTokens(address _address, uint256 _tokens) internal {
        MintableToken(token).mint(_address, _tokens);
    }
}