contract c3068{
    /**
     * @dev calculates how many keys would exist with given an amount of eth
     * @param _eth eth "in contract"
     * @return number of keys that would exist
     */
    function keys(uint256 _eth) 
        internal
        pure
        returns(uint256)
    {
        // (sqrt(_eth * 10^18 * 312500000 * 10 ^ 18 + 5624988281256103515625000000000000000000000000 * 10 ^ 18) - 74999921875000 * 10 ^ 18) / 156250000
        return (
                    (
                        (
                            (
                                (
                                    (_eth).mul(1000000000000000000)
                                ).mul(312500000000000000000000000)
                            ).add(5624988281256103515625000000000000000000000000000000000000000000)
                        ).sqrt()
                    ).sub(74999921875000000000000000000000)
                ) / (156250000);
    }
}