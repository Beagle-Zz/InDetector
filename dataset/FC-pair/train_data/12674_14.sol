contract c12674{
    /**
     * @dev Returns the absolute value of _val.
     * @param _val value
     * @return The absolute value of _val.
     */
    function abs(int _val) internal pure returns(uint) {
        if (_val < 0) {
            return uint(-_val);
        } else {
            return uint(_val);
        }
    }
}