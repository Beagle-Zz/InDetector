contract c7076{
  // @dev Set the address of the contract that represents CryptoSaga Cards.
  function setCryptoSagaCardSwapContract(address _contractAddress)
    public
    onlyOwner
  {
    swapContract = CryptoSagaCardSwap(_contractAddress);
  }
}