contract c4016{
  // @dev Set Record Contract.
  function setRecordContract(address _address)
    onlyOwner
    public
  {
    recordContract = CryptoSagaArenaRecord(_address);
  }
}