contract c18994{
  /// @dev send ether from the completed crowdsale to the owners wallet address
  /// @param self Stored crowdsale from crowdsale contract
  /// @return true if owner withdrew eth
  function withdrawOwnerEth(DirectCrowdsaleStorage storage self) public returns (bool) {
    if ((!crowdsaleEnded(self)) && (self.token.balanceOf(this)>0)) {
      emit LogErrorMsg(0, "Cannot withdraw owner ether until after the sale!");
      return false;
    }
    require(msg.sender == self.owner);
    require(self.ownerBalance > 0);
    uint256 amount = self.ownerBalance;
    self.ownerBalance = 0;
    self.owner.transfer(amount);
    emit LogOwnerEthWithdrawn(msg.sender,amount,"Crowdsale owner has withdrawn all funds!");
    return true;
  }
}