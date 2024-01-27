contract c8358{
    /**
    * @dev Checks modifier and allows transfer if tokens are not locked.
    * @param _from The address that will send the tokens.
    * @param _to The address that will recieve the tokens.
    * @param _value The amount of tokens to be transferred.
    */
    function transferFrom(address _from, address _to, uint _value) public canTransfer(_from, _value) returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}