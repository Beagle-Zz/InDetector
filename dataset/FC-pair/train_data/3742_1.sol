contract c3742{
    //Divides 2 numbers, solidity automatically throws if _y is 0.
    function div(uint256 _x, uint256 _y) internal pure returns (uint256 result){
        result = _x / _y;
        return result;
    }
}