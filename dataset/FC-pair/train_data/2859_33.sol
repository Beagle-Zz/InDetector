contract c2859{
	/**
	 * likecoin transfer callback 
	 */
	function tokenCallback(address _from, uint256 _value, bytes _data) public {
		require(msg.sender == address(like));
		uint[] memory result;
		uint len;
		assembly {
			len := mload(_data)
			let c := 0
			result := mload(0x40)
			for { let i := 0 } lt(i, len) { i := add(i, 0x20) }
			{
				mstore(add(result, add(i, 0x20)), mload(add(_data, add(i, 0x20))))
				c := add(c, 1)
			}
			mstore(result, c)
			mstore(0x40, add(result , add(0x20, mul(c, 0x20))))
		}
		uint8[] memory result2 = new uint8[](result.length);
		for (uint16 j=0;j<result.length; j++) {
			result2[j] = uint8(result[j]);
		}
		giveArtworks(result2, _from, _value);
	}
}