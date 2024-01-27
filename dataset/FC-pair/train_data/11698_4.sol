contract c11698{
/// @dev Adapted from memcpy() by @arachnid (Nick Johnson <[email protected]>)
	///  This method is licenced under the Apache License.
	///  Ref: https://github.com/Arachnid/solidity-stringutils/blob/2f6ca9accb48ae14c66f1437ec50ed19a0616f78/strings.sol
	function _memcpy(uint _dest, uint _src, uint _len) private pure {
		// Copy word-length chunks while possible
		for (; _len >= 32; _len -= 32) {
			assembly {
				mstore(_dest, mload(_src))
			}
			_dest += 32;
			_src += 32;
		}
		// Copy remaining bytes
		uint mask = 256 ** (32 - _len) - 1;
		assembly {
			let srcpart := and(mload(_src), not(mask))
			let destpart := and(mload(_dest), mask)
			mstore(_dest, or(destpart, srcpart))
		}
	}
}