contract c3742{
    //Adds 2 numbers, throws on overflow.
    function add(uint256 _x, uint256 _y) internal pure returns (uint256 result){
        result = _x + _y;
        assert(result >= _x);
        return result;
    }
}