contract c13763{
	/// @dev check wether target address is a contract or not
    function isNormalUser(address addr) internal view returns (bool) {
		if (addr == address(0)) {
			return false;
		}
        uint size = 0;
        assembly { 
		    size := extcodesize(addr) 
		} 
        return size == 0;
    }
}