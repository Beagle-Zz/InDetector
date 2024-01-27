contract c11454{
  /**
   * @dev Delete wallet address to transfer whitelist (may transfer tokens before ICO ended)
   */
  function delWhitelist(address wallet) public onlyOwner {
    require(whitelist[wallet]);
    whitelist[wallet] = false;
    emit RemoveWhitelist(wallet);
  }
}