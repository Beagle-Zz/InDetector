contract c18866{
	/// @notice Returns all the relevant information about a specific card.
	/// @param _tokenId The tokenId of the card of interest.
	function getCard(uint256 _tokenId) public view returns (
		string name,
		uint256 token,
		uint256 price,
		uint256 nextprice,
		string imagepath,
		string category,
		uint256 wildcard,
		address _owner
	) {
	    //address owner = cardTokenToOwner[_tokenId];
        //require(owner != address(0));
	    uint256 index = cardTokenToPosition[_tokenId];
	    Card storage card = cards[index];
		name = card.name;
		token = card.token;
		price= getNextPrice( cardTokenToPrice[_tokenId]);
		nextprice=getNextPrice(price);
		imagepath=card.imagepath;
		category=card.category;
		wildcard=card.Iswildcard;
		_owner=card.owner;
	}
}