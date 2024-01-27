contract c10416{
    // Function to have a way to add business logic to your crowdsale when buying
    function getTokenAmount(uint256 weiAmount) internal returns(uint256) {
        //Logic for pricing based on the Tiers of the crowdsale
        // These bonus amounts and the number of tiers itself can be changed
        /*This means that:
            - If you purchase within the tier 1 ICO (earliest tier)
            you receive a 20% bonus in your token purchase.
            - If you purchase within the tier 2 ICO (later tier)
            you receive a 10% bonus in your token purchase.
            - If you purchase outside of any of the defined bonus tiers then you
            receive the original rate of tokens (1 token per 0.01 ether)
            */
        if (now>=tier1Start && now < tier1End) {
            rate = 120;
        }else if (now>=tier2Start && now < tier2End) {
            rate = 110;
        }else {
            rate = 100;
        }
        return weiAmount.mul(rate);
    }
}