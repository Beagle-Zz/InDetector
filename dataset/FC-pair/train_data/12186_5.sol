contract c12186{
    /// @notice Used to transfer funds
    /// @param _receiver Eth address to send TKP tokens too
    /// @param _amount The amount of TKP tokens in wei to send
    function transfer(address _receiver, uint256 _amount)
        public
        returns (bool success)
    {
        require(transferCheck(msg.sender, _receiver, _amount));
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_receiver] = balances[_receiver].add(_amount);
        Transfer(msg.sender, _receiver, _amount);
        return true;
    }
}