contract c4690{
    /// Finalize campaign logic
    function _finalizeCampaign(ButtonCampaign storage c) internal {
        require(c.deadline < now, "Before deadline!");
        require(!c.finalized, "Already finalized!");
        if(c.presses != 0) {//If there were presses
            uint totalBalance = c.total.balanceETH;
            //Handle all of the accounting            
            transferETH(c.total, winners[c.lastPresser], totalBalance.wmul(c.jackpotFraction));
            winners[c.lastPresser].name = bytes32(c.lastPresser);
            totalWon = totalWon.add(totalBalance.wmul(c.jackpotFraction));
            transferETH(c.total, revenue, totalBalance.wmul(c.devFraction));
            totalRevenue = totalRevenue.add(totalBalance.wmul(c.devFraction));
            transferETH(c.total, charity, totalBalance.wmul(c.charityFraction));
            totalCharity = totalCharity.add(totalBalance.wmul(c.charityFraction));
            //avoiding rounding errors - just transfer the leftover
            // transferETH(c.total, nextCampaign, c.total.balanceETH);
            totalPresses = totalPresses.add(c.presses);
            emit Winrar(c.lastPresser, totalBalance.wmul(c.jackpotFraction));
        } 
        // if there will be no next campaign
        if(stopped) {
            //transfer leftover to devs' base account
            transferETH(c.total, base, c.total.balanceETH);
        } else {
            //otherwise transfer to next campaign
            transferETH(c.total, nextCampaign, c.total.balanceETH);
        }
        c.finalized = true;
    }
}