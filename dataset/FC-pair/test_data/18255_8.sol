contract c18255{
  // Stake on a specific country.
  function stake(uint256 countryID) external validCountry(countryID) payable {
    require(now <= STAKE_DEADLINE);
    require(!refundsEnabled);
    require(msg.value >= MIN_STAKE);
    address staker = msg.sender;
    uint256 weiAmount = msg.value;
    uint256 fee = weiAmount.mul(DEVELOPER_FEE_PERCENTAGE) / PERCENTAGE_100;
    uint256 actualStake = weiAmount.sub(fee);
    weiReceived[staker] = weiReceived[staker].add(actualStake);
    stakes[staker][countryID] = stakes[staker][countryID].add(actualStake);
    countryStats[countryID].amount = countryStats[countryID].amount.add(actualStake);
    if (stakes[staker][countryID] == actualStake) {
      countryStats[countryID].numberOfStakers++;
    }
    collectedFees = collectedFees.add(fee);
    totalPot = totalPot.add(actualStake);
    Stake(staker, countryID, actualStake);
  }
}