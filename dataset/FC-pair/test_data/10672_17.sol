contract c10672{
	/// @notice Get a country by its id
	/// @param id The country id
	function getCountryById(uint8 id) external view returns (address, uint, uint) {
		return (
			countries[id].owner,
			countries[id].id,
			countries[id].price
		);
	}
}