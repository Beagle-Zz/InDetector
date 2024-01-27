contract c498{
    /**
     * @dev calculates how much eth would be in contract given a number of keys
     * @param _keys number of keys "in contract"
     * @return eth that would exists
     */
    function calceth(uint256 _keys)
        pure
    public
        returns(uint256)
    {
        return( (_keys)/100 );
    } 
}