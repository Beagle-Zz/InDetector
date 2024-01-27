contract c8307{
  /**
   * @dev Set the storage contract address
   * @param _investorsStorage Investors storage contract address
   */
  function setStorageAddress(address _investorsStorage) onlyOwner public { // set the storage contract address
    investorsStorage = InvestorsStorage(_investorsStorage);
  }
}