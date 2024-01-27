contract c11454{
  /**
   * @dev Add wallet address to transfer whitelist (may transfer tokens before ICO ended)
   */
  function addToWhitelist(address wallet) public onlyOwner {
    require(!whitelist[wallet]);
    whitelist[wallet] = true;
    emit AddedToWhitelist(wallet);
  }
}