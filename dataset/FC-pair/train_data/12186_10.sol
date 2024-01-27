contract c12186{
    /// @notice Used to create new tokens and increase total supply
    /// @param _amount The amount of TKP tokens in wei to create
    function tokenFactory(uint256 _amount) public
        onlyOwner
        returns (bool success)
    {
        require(tokenMinter(_amount));
        totalSupply = totalSupply.add(_amount);
        balances[msg.sender] = balances[msg.sender].add(_amount);
        Transfer(0, msg.sender, _amount);
        return true;
    }
}