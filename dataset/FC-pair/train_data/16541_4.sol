contract c16541{
    /**
     * Transfer tokens
     */
    function transfer(address _to, uint256 _value) public returns (bool success){
        _transfer(msg.sender, _to, _value);
        return true;
    }
}