contract c2276{
    // @dev Decoding helper function from Seriality
    function _bytesToUint256(uint _offst, bytes memory _input) internal pure returns (uint256 _output) {
        assembly {
            _output := mload(add(_input, _offst))
        }
    }
}