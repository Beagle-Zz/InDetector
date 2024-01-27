contract c3348{
    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` on behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // 检查限额 Check allowance
        allowance[_from][msg.sender] -= _value;  //减少相应的限额
        _transfer(_from, _to, _value);  //调用调用交易，完成交易
        return true;
    }
}