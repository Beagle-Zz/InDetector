contract c10237{
  /**
   * @dev place a bet with his/her choice
   * @param choice indicate which team user choose
   */
  function placeBet(uint choice) public payable {
    require(now < betInfo.startTime);
    require(choice == 1 ||  choice == 2 || choice == 3);
    require(msg.value >= betInfo.minimumBet);
    require(!checkPlayerExists(msg.sender));
    if (!isSolvent(choice, msg.value)) {
      revert();
    }
    playerInfo[msg.sender].betAmount = msg.value;
    playerInfo[msg.sender].choice = choice;
    totalBetAmount = totalBetAmount.add(msg.value);
    numberOfBet = numberOfBet.add(1);
    updateAmountOfEachChoice(choice, msg.value);
    players.push(msg.sender);
    LogParticipant(msg.sender, choice, msg.value);
  }
}