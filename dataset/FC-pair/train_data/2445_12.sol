contract c2445{
    /**
    * @dev transfer tokens for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        bool result = _transfer(msg.sender, _to, _value);
        emit Transfer(msg.sender, _to, _value); 
        return result;
    }
}