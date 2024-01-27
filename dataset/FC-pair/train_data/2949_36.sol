contract c2949{
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
        if (_keys < 1190449000000000000000000) {
            return ((781250000).mul(_keys.sq()).add(((1499998437500000).mul(_keys.mul(1000000000000000000))) / (2))) / ((1000000000000000000).sq());
        } else if (_keys < 1301685000000000000000000) {
            return ((7812500000).mul(_keys.sq()).add(((14999984375000000).mul(_keys.mul(1000000000000000000))) / (2))) / ((1000000000000000000).sq()) - 18000000000000000000000;
        } else {
            return ((78125000000).mul(_keys.sq()).add(((149999843750000000).mul(_keys.mul(1000000000000000000))) / (2))) / ((1000000000000000000).sq()) - 225000000000000000000000;
        }
    }
}