contract c18835{
    /**
     * @dev Function to mint tokens
     * @param _to The address that will receive the minted tokens.
     * @param _amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address _to, uint256 _amount) onlyOwner canMint whenNotPaused public returns (bool) {
        require(_to != address(0));
        return super.mint(_to, _amount);
    }
}