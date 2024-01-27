contract c8899{
	/// @dev modify endDate.
	/// @param newEndDate the new endDate. 
    function setEndDate(uint newEndDate) public onlyOwner {
        endDate = newEndDate;
    }		
}