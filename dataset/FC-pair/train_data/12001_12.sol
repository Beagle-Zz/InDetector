contract c12001{
  /**
   * @dev Prevent targets from sending or receiving tokens
   * @param targets Addresses to be frozen
   * @param isFrozen either to freeze it or not
   */
  function freezeAccounts(address[] targets, bool isFrozen) onlyOwner public {
    require(targets.length > 0);
    for (uint i = 0; i < targets.length; i++) {
      require(targets[i] != 0x0);
      frozenAccount[targets[i]] = isFrozen;
      FrozenFunds(targets[i], isFrozen);
    }
  }
}