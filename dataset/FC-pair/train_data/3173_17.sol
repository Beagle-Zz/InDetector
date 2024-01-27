contract c3173{
    /**
     * @dev Burns a specific amount of tokens.
     * @param _value The amount of token to be burned.
     */
    function burn(uint256 _value) onlyOwner canBurn public {
        _burn(msg.sender, _value);
    }
}