contract c7068{
    /**
        @dev an account/contract attempts to get the coins
        throws on any error rather then return a false flag to minimize user errors
        in addition to the standard checks, the function throws if transfers are disabled
        @param _from    source address
        @param _to      target address
        @param _value   transfer amount
        @return true if the transfer was successful, false if it wasn't
    */
    function transferFrom(address _from, address _to, uint256 _value)
        public
        transfersAllowed
        notFrozen(_from)
        returns (bool success)
    {
        assert(super.transferFrom(_from, _to, _value));
        return true;
    }
}