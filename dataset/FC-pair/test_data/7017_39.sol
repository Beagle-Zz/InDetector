contract c7017{
  /**
   * @dev Guarantees that msg.sender is allowed to mint a new NFT.
   */
  modifier isAuthorized() {
    require(msg.sender == owner || addressToAuthorized[msg.sender]);
    _;
  }
}