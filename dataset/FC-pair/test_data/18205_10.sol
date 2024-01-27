contract c18205{
    /// @notice Only central mint can burn from their own supply
    function burn(uint256 _value, uint256 _confirmation) onlyOwner public returns (bool success) {
        require(_confirmation==7007);                 // To make sure it's not done by mistake
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }
}