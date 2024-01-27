contract c1153{
  /// Owner initates the transfer of the card to another account
  /// @param _to The address for the card to be transferred to.
  /// @param _divCardId The ID of the card that can be transferred if this call succeeds.
  /// @dev Required for ERC-721 compliance.
  function transfer(address _to, uint _divCardId)
    public
    isNotContract
  {
    require(_owns(msg.sender, _divCardId));
    require(_addressNotNull(_to));
    _transfer(msg.sender, _to, _divCardId);
  }
}