contract c10455{
	//Interest Check Function
    function annualInterest() constant returns(uint interest) {
        uint _now = now;
        interest = maxMintProofOfStake;
        if((_now.sub(stakeStartTime)).div(1 years) == 0) {
            interest = maxMintProofOfStake * yearOneMultiplier;
        } else if((_now.sub(stakeStartTime)).div(1 years) == 1){
            interest = maxMintProofOfStake * yearTwoMultiplier;
        }
    }
}