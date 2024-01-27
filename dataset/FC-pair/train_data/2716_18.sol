contract c2716{
    /// @dev Helper function to claimStake that modularizes the minting via staking calculation
    /// @param _now when the user stopped staking. Passed in as a variable to allow for checking without using gas from the getStakingGains function.
    /// @return uint for total coins to be minted
    function calculateStakeGains(uint _now) view private returns (uint mintTotal)  {
      uint _nowAsTimingVariable = _now.div(timingVariable);    // Today as a unique value in unix time
      uint _initialStakeTimeInVariable = stakeBalances[msg.sender].initialStakeTime; // When the user started staking as a unique day in unix time
      uint _timePassedSinceStakeInVariable = _nowAsTimingVariable.sub(_initialStakeTimeInVariable); // How much time has passed, in days, since the user started staking.
      uint _stakePercentages = 0; // Keeps an additive track of the user's staking percentages over time
      uint _tokensToMint = 0; // How many new Scale tokens to create
      uint _lastUsedVariable;  // Last day the totalScaleStaked was updated
      // Average this msg.sender's relative percentage ownership of totalScaleStaked throughout each day since they started staking
      for (uint i = _initialStakeTimeInVariable; i < _nowAsTimingVariable; i++) {
        // If the day exists add it to the percentages
        if (totalStakingHistory[i] != 0) {
           // If the day does exist add it to the number to be later averaged as a total average percentage of total staking
          _stakePercentages = _stakePercentages.add(calculateFraction(stakeBalances[msg.sender].stakeBalance, totalStakingHistory[i], decimals));
          // Set this as the last day someone staked
          _lastUsedVariable = totalStakingHistory[i];
        }
        else {
          // Use the last day found in the totalStakingHistory mapping
          _stakePercentages = _stakePercentages.add(calculateFraction(stakeBalances[msg.sender].stakeBalance, _lastUsedVariable, decimals));
        }
      }
        // Get the account's average percentage staked of the total stake over the course of all days they have been staking
        uint _stakePercentageAverage = calculateFraction(_stakePercentages, _timePassedSinceStakeInVariable, 0);
        // Calculate this account's mint rate per second while staking
        uint _finalMintRate = stakingMintRate.mul(_stakePercentageAverage);
        // Account for 18 decimals when calculating the amount of tokens to mint
        _finalMintRate = _finalMintRate.div(1 ether);
        // Calculate total tokens to be minted. Multiply by timingVariable to convert back to seconds.
        if (_timePassedSinceStakeInVariable >= 365) {
          // Tokens were staked for the maximum amount of time, one year. Give them one year's worth of tokens. ( this limit is placed to avoid gas limits)
          _tokensToMint = calculateMintTotal(timingVariable.mul(365), _finalMintRate);
        }
        else {
          // Tokens were staked for less than the maximum amount of time
          _tokensToMint = calculateMintTotal(_timePassedSinceStakeInVariable.mul(timingVariable), _finalMintRate);
        }
        return  _tokensToMint;
    }
}