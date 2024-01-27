contract c8314{
  /**
   * @dev Add members to vault to lock funds
   * @param _member Member to be added to the vault
   * @param _tokens Amount of tokens to be locked
   */
  function addMembers(address[] _member, uint256[] _tokens) onlyOwner public {
    require(_member.length > 0);
    require(_member.length == _tokens.length);
    Member memory member;
    for (uint256 i = 0; i < _member.length; i++) {
      member.memberAddress = _member[i];
      member.tokens = _tokens[i];
      team.push(member);
    }
  }
}