contract c8970{
    /// @notice send bonus token to broker
    function requestBonus() external{
      require(getState()==State.Success);
      uint256 bonusAmount = bonus[msg.sender];
      assert(bonusAmount>0);
      require(bonusAmount<=safeSub(bonusAndBountyTokens,bonusAmount));
      balanceOf[msg.sender] = safeAdd(balanceOf[msg.sender],bonusAmount);
      bonus[msg.sender] = 0;
      bonusAndBountyTokens = safeSub(bonusAndBountyTokens,bonusAmount);
      emit BonusTransfer(msg.sender,bonusAmount,block.number);
      emit Transfer(0,msg.sender,bonusAmount);
    }
}