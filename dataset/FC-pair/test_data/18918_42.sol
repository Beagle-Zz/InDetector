contract c18918{
	/// @dev allow any user to set rabbit data, with a signed message from coo
	function setRabbitData(
		uint _tokenId, 
		uint32 _explosive, 
		uint32 _endurance, 
		uint32 _nimble,
		uint _taskId,
		uint8 v, 
		bytes32 r, 
		bytes32 s
	) external {
		require(usedSignId[_taskId] == 0);
		Auction storage auction = tokenIdToAuction[_tokenId];
		require (auction.startedAt == 0);
		uint[5] memory arr = [_tokenId, _explosive, _endurance, _nimble, _taskId];
		string memory text = uint5ToStr(arr);
		address signer = verify(text, v, r, s);
		require(signer == cooAddress);
		RabbitData storage rdata = rabbits[_tokenId];
		rdata.explosive = _explosive;
		rdata.endurance = _endurance;
		rdata.nimble = _nimble;
		rabbits[_tokenId] = rdata;		
		usedSignId[_taskId] = 1;
		emit UpdateComplete(msg.sender, _tokenId);
	}
}