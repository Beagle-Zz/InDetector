contract c12467{
    // save some gas by making only one contract call
    function burnFrom(address _from, uint256 _value) returns (bool) 
    {
        assert( transferFrom( _from, msg.sender, _value ) );
        return burn(_value);
    }
}