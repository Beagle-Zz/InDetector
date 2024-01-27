contract c7066{
  /**
   * Set smart contract owner.
   *
   * @param _newOwner address of the new owner
   */
  function setOwner (address _newOwner) public {
    require (msg.sender == owner);
    owner = _newOwner;
  }
}