contract c10189{
    /**
    * @dev Mint new locked tokens, which will unlock progressively.
    * @param _to The address that will receieve the minted locked tokens.
    * @param _amount The amount of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function mintLocked(address _to, uint256 _amount) public onlyOwner canMint returns(bool minted) {
        initiallyLockedBalanceOf[_to] = initiallyLockedBalanceOf[_to].add(_amount);
        return mint(_to, _amount);
    }
}