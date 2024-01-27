contract c12674{
    /**
     * @dev Calculate minimum.
     */
    function min(uint _val1, uint _val2) internal pure returns(uint) {
        return _val1 <= _val2 ? _val1 : _val2;
    }
}