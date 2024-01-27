contract c4166{
  /**
   * @dev Make safeTrasferFrom() pausable
   */
  function safeTransferFrom(
    address _from,
    address _to,
    uint256 _tokenId,
    bytes _data
  )
    public
    whenNotPaused
    canPayFees(transferFee)
  {
    return super.safeTransferFrom(
      _from,
      _to,
      _tokenId,
      _data
    );
  }
}