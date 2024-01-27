contract c12519{
    // Transfer token to a specified address   
    function transfer(address _to, uint _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        return transferMain(msg.sender, _to, _value);
    }
}