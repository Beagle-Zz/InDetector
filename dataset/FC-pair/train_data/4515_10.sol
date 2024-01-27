contract c4515{
	// Returns the memory address of the first byte of the first occurrence of
	// `needle` in `self`, or the first byte after `self` if not found.
	function findPtr(uint selflen, uint selfptr, uint needlelen, uint needleptr) private pure returns (uint) {
		uint ptr = selfptr;
		uint idx;
		if (needlelen <= selflen) {
			if (needlelen <= 32) {
				bytes32 mask = bytes32(~(2 ** (8 * (32 - needlelen)) - 1));
				bytes32 needledata;
				assembly { needledata := and(mload(needleptr), mask) }
				uint end = selfptr + selflen - needlelen;
				bytes32 ptrdata;
				assembly { ptrdata := and(mload(ptr), mask) }
				while (ptrdata != needledata) {
					if (ptr >= end)
						return selfptr + selflen;
					ptr++;
					assembly { ptrdata := and(mload(ptr), mask) }
				}
				return ptr;
			} else {
				// For long needles, use hashing
				bytes32 hash;
				assembly { hash := sha3(needleptr, needlelen) }
				for (idx = 0; idx <= selflen - needlelen; idx++) {
					bytes32 testHash;
					assembly { testHash := sha3(ptr, needlelen) }
					if (hash == testHash)
						return ptr;
					ptr += 1;
				}
			}
		}
		return selfptr + selflen;
	}
}