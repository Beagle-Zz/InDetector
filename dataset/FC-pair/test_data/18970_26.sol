contract c18970{
    /**
   * @dev Redeem Reward tokens from one rewards array to balances array
   * @param _beneficiary address The address which contains the reward as well as the address to which the balance will be transferred
   * @param _value uint256 the amount of tokens to be redeemed
   */
    function redeemReward(
        address _beneficiary, 
        uint256 _value
    ) external nonReentrant whenNotPaused{
        //Need to consider what happens to rewards after the stopping of minting process
        require(msg.sender == _beneficiary);
        require(_value >= minimumRewardWithdrawalLimit);
        require(reward[_beneficiary] >= _value);
        reward[_beneficiary] = reward[_beneficiary].sub(_value);
        balances[_beneficiary] = balances[_beneficiary].add(_value);
        totalRewardsRedeemed = totalRewardsRedeemed.add(_value);
        emit RedeemReward(_beneficiary, _value);
    }
}