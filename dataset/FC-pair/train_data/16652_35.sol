contract c16652{
	/// @dev Returns the current Cap preIco.
	/// @param _roundNum the caps 
	function getCapTab(uint _roundNum) public view returns (uint) {			
		return (StepCaps[_roundNum]);
    }
}