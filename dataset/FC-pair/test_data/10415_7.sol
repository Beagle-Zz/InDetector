contract c10415{
  /**
   * @dev to bet which team will be the champion
   * @param choice the choice of the participant(actually team id)
   */
  function placeBet(uint choice) payable beforeTimestamp(startTime) public {
    require(choice > 0);
    require(!checkPlayerExists(msg.sender));
    require(msg.value >= minimumBet);
    playerInfo[msg.sender].betAmount = msg.value;
    playerInfo[msg.sender].choice = choice;
    totalBetAmount = totalBetAmount.add(msg.value);
    numberOfBet = numberOfBet.add(1);
    players.push(msg.sender);
    numberOfChoice[choice] = numberOfChoice[choice].add(1);
    addressOfChoice[choice][msg.sender] = true;
    LogParticipant(msg.sender, choice, msg.value);
  }
}