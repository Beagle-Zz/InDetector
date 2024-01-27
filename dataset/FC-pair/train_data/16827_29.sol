contract c16827{
        /**
        * @dev Sell tokens during pre-ICO.
        * @dev Sell tokens only for whitelisted wallets.
        */
        function sellTokensPreIco() beforeReachingHardCap whenWhitelisted(msg.sender) whenNotPaused public payable {
            require(isPreIco());
            require(msg.value > 0);
            uint256 weiAmount = msg.value;
            uint256 excessiveFunds = 0;
            uint256 plannedWeiTotal = weiRaisedTotal.add(weiAmount);
            if (plannedWeiTotal > maxcap) {
                excessiveFunds = plannedWeiTotal.sub(maxcap);
                weiAmount = maxcap.sub(weiRaisedTotal);
            }
            investments[msg.sender] = investments[msg.sender].add(weiAmount);
            weiRaisedPreIco = weiRaisedPreIco.add(weiAmount);
            weiRaisedTotal = weiRaisedTotal.add(weiAmount);
            addInvestmentPreIco(msg.sender, weiAmount);
            if (excessiveFunds > 0) {
                msg.sender.transfer(excessiveFunds);
            }
        }
}