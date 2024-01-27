contract c13829{
  // execution allowed only for contract owner or api address
  modifier onlyOwnerOrApi() {
	require(msg.sender == owner || msg.sender == api);
    if (msg.sender == api && api != owner) {
      require(!apiAccessDisabled);
	}
    _;
  }
}