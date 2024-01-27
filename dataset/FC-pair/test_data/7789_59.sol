contract c7789{
  /**
   * @dev Transfers tokens from one address to another.
   * @param _from address The address which you want to send tokens from.
   * @param _to address The address which you want to transfer to.
   * @param _value uint256 The amount of tokens to be transferred.
   */
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    onlyWhenTransferAllowed()
    validDestination(_to)
    public
    returns (bool _success)
  {
    _success = super.transferFrom(_from, _to, _value);
  }
}