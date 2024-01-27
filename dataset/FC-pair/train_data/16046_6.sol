contract c16046{
    /**
    * Allows the owner of tokens to approve another to spend tokens on his or her behalf
    *
    * @param _spender The address which is being allowed to spend tokens on the owner' behalf
    * @param _value The amount of tokens to be sent
    **/
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != 0x0 && _value > 0);
        if(allowances[msg.sender][_spender] > 0 ) {
            allowances[msg.sender][_spender] = 0;
        }
        allowances[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}