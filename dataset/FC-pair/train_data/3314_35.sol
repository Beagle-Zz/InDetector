contract c3314{
    /**
     * @dev calculates how many keys would exist with given an amount of eth
     * @param _eth eth "in contract"
     * @return number of keys that would exist
     */
    // todo: change this to something faster
    function keys(uint256 _eth)
        internal
        pure
        returns(uint256)
    {
        return (((((_eth).mul(2)).mul(10000000000000000000000000)).add(1000000000000000000000000000000000000000000)).sqrt()).sub(1000000000000000000000);
    }
}