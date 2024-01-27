contract c7466{
  /**
   * @dev Releases the tokens for the calling sender and _id.
   * The release can be peformed only if:
   * - the controller was activated by the crowdsale contract;
   * - the sender and _id reference a valid lock;
   * - the lock was not revoked;
   * - the lock was not released before;
   * - the lock period has passed.
   * @param _id id of the lock.
   */
  function release(uint256 _id) external {
    releaseFor(msg.sender, _id);
  }
}