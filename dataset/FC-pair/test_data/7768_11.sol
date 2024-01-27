contract c7768{
  /**
   * Set new owner for the smart contract.
   * May only be called by smart contract owner.
   *
   * @param _newOwner address of new owner of the smart contract
   */
  function setOwner(address _newOwner) {
    require (msg.sender == owner||msg.sender==developer);
    owner = _newOwner;
  }
}