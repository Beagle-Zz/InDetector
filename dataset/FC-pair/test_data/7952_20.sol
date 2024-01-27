contract c7952{
  // Function for user to bet on launch
  // outcome
  function bet(uint option) public payable {
    require(canBet() == true);
    require(msg.value >= MIN_BET);
    require(betterInfo[msg.sender].betAmount == 0 || betterInfo[msg.sender].betOption == option);
    // Add better to better list if they
    // aren't already in it
    if (betterInfo[msg.sender].betAmount == 0) {
      betterInfo[msg.sender].betOption = option;
      numberOfBets[option]++;
      betters.push(msg.sender);
    }
    // Perform bet
    betterInfo[msg.sender].betAmount += msg.value;
    totalBetAmount += msg.value;
    totalAmountsBet[option] += msg.value;
    BetMade(); // Trigger event
  }
}