contract c12018{
    // A simple library to allow appending to memory arrays.
    function appendUint256(uint256[] memory arr, uint256 val) internal pure returns (uint256[] memory toRet) {
        toRet = new uint256[](arr.length + 1);
        for (uint256 i = 0; i < arr.length; i++) {
            toRet[i] = arr[i];
        }
        toRet[arr.length] = val;
    }
}