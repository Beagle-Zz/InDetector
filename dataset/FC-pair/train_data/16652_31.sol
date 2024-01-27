contract c16652{
	/// @dev Returns the current rate.
	function getTokenRate() public constant returns (uint) {
        return (tokenRate);
    }    
}