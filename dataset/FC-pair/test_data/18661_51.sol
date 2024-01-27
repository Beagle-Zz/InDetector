contract c18661{
  // @dev Set the address of the contract that represents ERC721 Card.
  function setCardContract(address _contractAddress)
    public
    onlyOwner
  {
    cardAddess = _contractAddress;
  }
}