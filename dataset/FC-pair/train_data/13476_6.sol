contract c13476{
  /**
   * @notice Add to the amount this member has bought
   * @param _member Address of the corresponding member
   * @param _amountBought Amount of tokens this member has bought
   */
  function addAmountBoughtAsMember(address _member, uint256 _amountBought) external {
    require(contractManager.authorize(contractName, msg.sender));
    require(_amountBought != 0);
    if(!members[_member]) {
      _addMember(_member);
    }
    bought[_member] = bought[_member].add(_amountBought);
    emit TokensBought(_member, _amountBought, bought[_member]);
  }
}