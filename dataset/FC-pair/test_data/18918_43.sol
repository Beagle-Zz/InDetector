contract c18918{
	/// @dev werify wether the message is form coo or not.
	function verify(string text, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {		
		bytes32 hash = keccak256(text);
		bytes memory prefix = "\x19Ethereum Signed Message:\n32";
		bytes32 prefixedHash = keccak256(prefix, hash);
		address tmp = ecrecover(prefixedHash, v, r, s);
		return tmp;
	}
}