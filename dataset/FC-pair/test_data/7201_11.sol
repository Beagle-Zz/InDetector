contract c7201{
  /// @dev Setter for feeWallet smart contract (Only owner)
  function changeFeeWallet(IFeeWallet _feeWallet) public onlyOwner {
    feeWallet = _feeWallet;
  }
}