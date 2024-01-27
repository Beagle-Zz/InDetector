contract c8090{
  /**
   * @dev Transfers token to a specified address.
   * @param _to The address to transfer to.
   * @param _value The amount to be transferred.
   */
  function transfer(
    address _to,
    uint256 _value
  )
    onlyWhenTransferAllowed()
    validDestination(_to)
    public
    returns (bool _success)
  {
    _success = super.transfer(_to, _value);
  }
}