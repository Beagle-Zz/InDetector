contract c16894{
  /**
 * get the frozen balance of account
 * @param _owner The account address
 */
  function frozenOf(address _owner) constant public returns (uint256) {
    return frozen[_owner];
  }
}