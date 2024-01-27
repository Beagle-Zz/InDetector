contract c3742{
    // Multiples 2 numbers, throws on overflow is detected.
    function mul(uint256 _x, uint256 _y) internal pure returns (uint256 result){
        if(_y == 0){
            return 0;
        }
        result = _x*_y;
        assert(_x == result/_y);
        return result;
    }
}