contract c11448{
  /**
   * @dev Update the Struc each time a country is sold.
   * Push the newOwner, update the price history
   */	
	function updateEntity(uint256 countryId, address newOwner, uint256 priceUpdate) internal {
		countryStructs[countryId].priceHistory += priceUpdate;
		if (itemHistory[countryId][newOwner] == 0 ){
			countryStructs[countryId].itemToAddressArray.push(newOwner);
		}
	  }
}