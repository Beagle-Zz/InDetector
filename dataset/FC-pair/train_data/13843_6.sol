contract c13843{
  // execution allowed only for contract superowner
  modifier onlySuperOwner() {
	require(msg.sender == superOwner);
    _;
  }
}