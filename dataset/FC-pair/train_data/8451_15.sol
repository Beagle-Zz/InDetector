contract c8451{
    /**
     * @dev Function to mint tokens
     */
    function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
        return token.mint(_to, _amount);
    }
}