contract c3048{
    /**
     * @dev calculates number of keys received given X eth
     * @param _eth current amount of eth in contract
     * @param _keyPrice eth being spent
     * @return amount of ticket purchased
     */
    function keysRec(uint256 _eth, uint256 _keyPrice)
        internal
        pure
        returns (uint256)
    {
        return (_eth/_keyPrice);
    }
}