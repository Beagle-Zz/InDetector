contract c2144{
    /**
     * @dev Burns a specific amount of tokens.
     * @param _amount The amount of token to be burned.
     */
    function burn(uint256 _amount) public
    onlyPayloadSize(1)
    {
        bool success = controller.burn(msg.sender, _amount);
        if (success) {
            emit Burn(msg.sender, _amount);
        }
    }
}