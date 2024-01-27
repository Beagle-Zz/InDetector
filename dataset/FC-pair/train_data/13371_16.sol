contract c13371{
  /**
  * @dev returns the mining status of the passed address.
  * @return A uint256 representing the mining status of the passed address.
  */
  function isMining(address _owner) public view returns (bool) {
    return nodes[_owner] != 0;
  }
}