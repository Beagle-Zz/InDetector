contract c2780{
    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint256 _value) public allowTransfer(_from) returns (bool) {
        require(_value <= allowed[_from][msg.sender], "Not enought allowance");
        bool result = _transfer(_from, _to, _value);
        if (result) {
            allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
            emit Transfer(_from, _to, _value);  
        }
        return result;
    }
}