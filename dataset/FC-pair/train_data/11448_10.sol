contract c11448{
  /**
   * @dev Creates new Struct for a country each time a new country is listed.
   */	
	function newEntity(uint256 countryId, uint256 startPrice) private returns(bool success) {
		countryStructs[countryId].startingPrice = startPrice;
		return true;
	}
}