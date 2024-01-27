contract c3314{
    /**
     * @dev calculates how much eth would be in contract given a number of keys
     * @param _keys number of keys "in contract"
     * @return eth that would exists
     */
    function eth(uint256 _keys)
        internal
        pure
        returns(uint256)
    {
        return ((_keys.sq()).add((2000000000000000000000).mul(_keys))) / (20000000000000000000000000);        
    }
}