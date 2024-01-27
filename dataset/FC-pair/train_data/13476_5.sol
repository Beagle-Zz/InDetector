contract c13476{
  /**
   * @notice Remove a member from this contract
   * @param _member Address of member that will be removed
   */
  function removeMember(address _member) external {
    require(contractManager.authorize(contractName, msg.sender));
    require(members[_member] == true);
    delete members[_member];
    for (uint256 i = 0; i < memberKeys.length; i++) {
      if (memberKeys[i] == _member) {
        delete memberKeys[i];
        break;
      }
    }
    emit MemberRemoved(_member);
  }
}