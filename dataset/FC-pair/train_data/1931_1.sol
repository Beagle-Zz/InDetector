contract c1931{
  /**
   * @dev Throws if called by any account other than the adminer.
   */
    modifier onlyAdminer {
        require(msg.sender == owner || msg.sender == adminer);
        _;
    }
}