contract c13329{
    // The function for obtaining smart contract funds in ETH. If all the checks are true, the token is
    // transferred to the buyer, taking into account the current bonus.
    function buyTokens(address _beneficiary) public payable {
        require(_beneficiary != 0x0);
        require(validPurchase());
        uint256 weiAmount = msg.value;
        uint256 ProfitProcent = getProfitPercent();
        uint256 value;
        uint256 percent;
        uint256 freezeTime;
        (value,
        percent,
        freezeTime) = getBonuses(weiAmount);
        Bonus memory curBonus = Bonus(value,percent,freezeTime);
        uint256 bonus = curBonus.procent;
        // --------------------------------------------------------------------------------------------
        // *** Scenario 1 - select max from all bonuses + check maxAllProfit
        //uint256 totalProfit = (ProfitProcent < bonus) ? bonus : ProfitProcent;
        // *** Scenario 2 - sum both bonuses + check maxAllProfit
        uint256 totalProfit = bonus.add(ProfitProcent);
        // --------------------------------------------------------------------------------------------
        totalProfit = (totalProfit > maxAllProfit) ? maxAllProfit : totalProfit;
        // calculate token amount to be created
        uint256 tokens = weiAmount.mul(rate).mul(totalProfit.add(100)).div(100 ether);
        // update state
        ethWeiRaised = ethWeiRaised.add(weiAmount);
        lokedMint(_beneficiary, tokens, curBonus.freezeTime);
        emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
        forwardFunds(_beneficiary);//forwardFunds(msg.sender);
    }
}