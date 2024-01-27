contract c13843{
  // execution allowed only for contract owner
  modifier onlyOwner() {
	require(msg.sender == owner);
    _;
  }
}