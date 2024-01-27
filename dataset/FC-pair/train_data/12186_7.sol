contract c12186{
    /// @notice Used to approve someone to send funds on your behalf
    /// @param _spender The eth address of the person you are approving
    /// @param _amount The amount of TKP tokens _spender is allowed to send (in wei)
    function approve(address _spender, uint256 _amount)
        public
        returns (bool approved)
    {
        require(_amount > 0);
        require(balances[msg.sender] >= _amount);
        allowance[msg.sender][_spender] = allowance[msg.sender][_spender].add(_amount);
        return true;
    }
}