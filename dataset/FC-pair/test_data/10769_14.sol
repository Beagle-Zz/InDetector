contract c10769{
    /**
	 * @dev util function to change bytes data to bytes32 data
	 * @param _data the bytes data to be converted
	 */
    function bytesToBytes32(bytes _data) public pure returns (bytes32 result) {
        assembly {
            result := mload(add(_data, 32))
        }
    }
}