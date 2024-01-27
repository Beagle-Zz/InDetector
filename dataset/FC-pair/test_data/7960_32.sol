contract c7960{
    /**
     * @dev The initialization method that creates a new mintable token.
     *
     * @param _name Token name
     * @param _symbol Token symbol
     * @param _decimals Token decimals
     */
    function initializeMintableTokenFundraiser(string _name, string _symbol, uint8 _decimals) internal {
        token = new StandardMintableToken(
            address(this), // The fundraiser is the token minter
            _name,
            _symbol,
            _decimals
        );
    }
}