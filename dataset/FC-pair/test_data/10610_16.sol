contract c10610{
  /**
  * @dev Throws if called by any account other than the owner.
  */
  modifier notBlacklisted() {
    require(blacklist[msg.sender] == false);
    _;
  }
}