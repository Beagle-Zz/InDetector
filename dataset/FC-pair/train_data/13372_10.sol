contract c13372{
    // hatch eggs into bats
    function hatchEggs(address ref) public whenNotPaused {
        // set user's referral only if which is empty
        if (referrals[msg.sender] == address(0) && referrals[msg.sender] != msg.sender) {
            referrals[msg.sender] = ref;
        }
        uint256 eggsUsed = getMyEggs();
        uint256 newBat = SafeMath.div(eggsUsed, EGGS_TO_HATCH_1BAT);
        hatcheryBat[msg.sender] = SafeMath.add(hatcheryBat[msg.sender], newBat);
        claimedEggs[msg.sender] = 0;
        lastHatch[msg.sender] = now;
        //send referral eggs 20% of user
        claimedEggs[referrals[msg.sender]] = SafeMath.add(claimedEggs[referrals[msg.sender]], SafeMath.div(eggsUsed, 5));
        //boost market to nerf bat hoarding
        // add 10% of user into market
        marketEggs = SafeMath.add(marketEggs, SafeMath.div(eggsUsed, 10));
    }
}