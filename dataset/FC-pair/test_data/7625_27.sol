contract c7625{
  /**
   * @dev Do finalization.
   * @return A boolean that indicates if the operation was successful.
   */
  function finalize()
    public
    onlyOwner
    whenNotFinalized
    returns (bool)
  {
    uint256 ownerBalance = balanceOf(owner);
    //Transfer what is left in owner to community wallet
    if (ownerBalance > 0) {
      transfer(communityWallet, ownerBalance);
    }
    uint256 advBtyBalance = balanceOf(advBtyWallet);
    //Transfer what is left in advisor & bounty wallet to community wallet
    //TODO: does not work probably because there is no approval
    if (advBtyBalance > 0) {
      transferFrom(advBtyWallet, communityWallet, advBtyBalance);
    }
    finalized = true;
    emit Finalize(ownerBalance.add(advBtyBalance));
    return true;
  }
}