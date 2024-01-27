contract c10847{
  	/// @dev Return tokens price list. It gets the same order as ids.
  	function getTokenPriceListByIds(uint[] _ids) external view returns(uint[]) {
  		uint[] memory result = new uint[](_ids.length);
  		uint counter = 0;
  		for (uint i = 0; i < _ids.length; i++) {
  			Country storage token = countries[_ids[i]];
  			result[counter] = token.price;
  			counter++;
  		}
  		return result;
  	}
}