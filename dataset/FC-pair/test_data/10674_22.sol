contract c10674{
  /**
  * @dev Gets the commitment of the specified address.
  * @param _miner The address to query the the commitment Of
  * @return the amount commited.
  */
  function commitmentOf(address _miner) public view returns (uint256) {
    return miners[_miner].value;
  }
}