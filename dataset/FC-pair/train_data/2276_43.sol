contract c2276{
    // @dev Decoding helper functions from Seriality
    function _bytesToAddress(uint _offst, bytes memory _input) internal pure returns (address _output) {
        assembly {
            _output := mload(add(_input, _offst))
        }
    }
}