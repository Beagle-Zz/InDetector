contract c2736{
    /// @dev It calls parent StandardToken.transferFrom() function. It will transfer from an address a certain amount of tokens to another address 
    /// @return True if the token is transfered with success 
    function transferFrom(address _from, address _to, uint256 _value)
        isAllowed(_from, _to) 
        public 
        returns (bool)
    {
        return super.transferFrom(_from, _to, _value);
    }
}