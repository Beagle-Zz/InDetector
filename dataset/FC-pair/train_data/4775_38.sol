contract c4775{
    /**
    * @dev Function to mint tokens
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint
    * @return A boolean that indicated if the operation was successful.
    */
    function mint(address _to, uint256 _amount) onlyOwnerOrAdmin(ROLE_MINT) canMint public returns (bool) {
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
        return true;
    }
}