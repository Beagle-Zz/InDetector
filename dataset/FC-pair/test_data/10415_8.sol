contract c10415{
  /**
   * @dev allow user to change their choice before a timestamp
   * @param choice the choice of the participant(actually team id)
   */
  function modifyChoice(uint choice) beforeTimestamp(startTime) public {
    require(choice > 0);
    require(checkPlayerExists(msg.sender));
    uint oldChoice = playerInfo[msg.sender].choice;
    numberOfChoice[oldChoice] = numberOfChoice[oldChoice].sub(1);
    numberOfChoice[choice] = numberOfChoice[choice].add(1);
    playerInfo[msg.sender].choice = choice;
    addressOfChoice[oldChoice][msg.sender] = false;
    addressOfChoice[choice][msg.sender] = true;
    LogModifyChoice(msg.sender, oldChoice, choice);
  }
}