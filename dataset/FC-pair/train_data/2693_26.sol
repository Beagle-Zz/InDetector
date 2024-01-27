contract c2693{
  // -----------------------------------------
  // Internal interface
  // -----------------------------------------
  /**
   * @dev Create a new token and stores it.
   * @param _name Token name
   * @param _owner The initial owner of this token, must be non-zero
   */
  function _createToken(
    string _name,
    address _owner
  )
    internal
    returns (uint)
  {
    Token memory _token = Token({
      name: _name
    });
    uint256 newTokenId = tokens.push(_token) - 1;
    // Check overflow newTokenId
    require(newTokenId == uint256(uint32(newTokenId)));
    emit Create(_owner, newTokenId, _name);
    // This will assign ownership
    _transfer(0, _owner, newTokenId);
    return newTokenId;
  }
}