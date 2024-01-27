contract c3686{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(transfersEnabled, "Tranfers are disabled");
    require(super.transfer(_to, _value));
    return true;
  }
}