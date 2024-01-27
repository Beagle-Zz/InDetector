contract c2603{
    /// @dev It calls parent BasicToken.transfer() function. It will transfer an amount of tokens to an specific address
    /// @return True if the token is transfered with success
    function transfer(address _to, uint256 _value) 
        isAllowed(msg.sender, _to)
        public
        returns (bool)
    {
        return super.transfer(_to, _value);
    }
}