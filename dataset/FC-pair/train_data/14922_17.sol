contract c14922{
  /// @dev Remove an old trusted contract address from the board.
  /// @param _oldTrustedContract the address to be removed. If it is not a
  //    trusted contract, do nothing.
  function removeTrustedContract(address _oldTrustedContract) public onlyOwner {
    int i = findTrustedContract(_oldTrustedContract);
    require(i >= 0);
    delete trustedContracts[uint(i)];
    TrustedContractAdded(_oldTrustedContract);
  }
}