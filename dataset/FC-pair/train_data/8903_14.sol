contract c8903{
    /**
    * @dev Function to mint tokens
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
        require(totalSupply_ + _amount <= cap);
        require(totalSupply_ + _amount >= totalSupply_);
        return super.mint(_to, _amount);
    }
}