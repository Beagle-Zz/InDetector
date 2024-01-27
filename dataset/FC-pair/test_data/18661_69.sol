contract c18661{
  // @dev Set the address of the contract that represents ERC20 Gold.
  function setGoldContract(address _contractAddress)
    onlyOwner
    public
  {
    goldContract = Gold(_contractAddress);
  }
}