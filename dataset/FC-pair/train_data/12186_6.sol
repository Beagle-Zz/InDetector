contract c12186{
    /// @notice Used to transfer funds on behalf of owner to receiver
    function transferFrom(address _owner, address _receiver, uint256 _amount) 
        public 
        returns (bool success)
    {
        require(allowance[_owner][msg.sender] >= _amount);
        require(transferCheck(_owner, _receiver, _amount));
        allowance[_owner][msg.sender] = allowance[_owner][msg.sender].sub(_amount);
        balances[_owner] =  balances[_owner].sub(_amount);
        balances[_receiver] = balances[_receiver].add(_amount);
        Transfer(_owner, _receiver, _amount);
        return true;
    }
}