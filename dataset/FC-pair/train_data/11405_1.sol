contract c11405{
 /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` on behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
 */
function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
     require(_to != address(0));
     require(_value <= balances[_from]);
     require(_value <= allowed[_from][msg.sender]);
     balances[_from] = balances[_from] - _value;
     balances[_to] = balances[_to] + _value;
     allowed[_from][msg.sender] = allowed[_from][msg.sender] - _value;
     emit Transfer(_from, _to, _value);
    return true;
}  
}