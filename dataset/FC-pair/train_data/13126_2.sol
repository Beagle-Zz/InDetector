contract c13126{
    // initial_withdrawal releases 60% of tokens
  	function initial_withdrawal(uint256 balance) private atPhase(Phases.initialTeamWithdrawal){
      	firstTeamWithdrawal = now + 13 weeks;
      	secondTeamWithdrawal = firstTeamWithdrawal + 13 weeks;
      	thirdTeamWithdrawal = secondTeamWithdrawal + 13 weeks;
      	fourthTeamWithdrawal = thirdTeamWithdrawal + 13 weeks;
      	fifthTeamWithdrawal = fourthTeamWithdrawal + 13 weeks;
      	sixthTeamWithdrawal = fifthTeamWithdrawal + 13 weeks;
      	seventhTeamWithdrawal = sixthTeamWithdrawal + 13 weeks;
      	eighthTeamWithdrawal = seventhTeamWithdrawal + 13 weeks;
      	uint256 amountToTransfer = safeDiv(safeMul(balance, 6), 10);
      	ERC20Token.transfer(beneficiary, amountToTransfer);
      	nextPhase();
  	}
}