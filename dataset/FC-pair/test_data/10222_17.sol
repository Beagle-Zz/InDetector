contract c10222{
    /**
    * @dev Burns a specific amount of tokens.
    * @param _value The amount of token to be burned.
    */
    function burn(uint256 _value) public {
        require(canBurn);
        BurnableToken.burn(_value);
    }
}