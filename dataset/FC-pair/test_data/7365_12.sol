contract c7365{
  /**
   * @dev Set ICO contract address to supply tokens
   * @param _icoContract address of an ICO smart contract
   */   
  function setIcoContract(address _icoContract) public onlyOwner {
    if (_icoContract != address(0)) {
      icoContract = _icoContract;
    }
  }
}