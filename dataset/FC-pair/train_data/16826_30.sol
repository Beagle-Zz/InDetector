contract c16826{
        /**
        * @dev Sell tokens during ICO.
        * @dev Sell tokens only for whitelisted wallets.
        */
        function sellTokensIco() beforeReachingHardCap whenWhitelisted(msg.sender) whenNotPaused public payable {
            require(isIco());
            require(msg.value > 0);
            uint256 weiAmount = msg.value;
            uint256 excessiveFunds = 0;
            uint256 plannedWeiTotal = weiRaisedTotal.add(weiAmount);
            if (plannedWeiTotal > maxcap) {
                excessiveFunds = plannedWeiTotal.sub(maxcap);
                weiAmount = maxcap.sub(weiRaisedTotal);
            }
            uint256 tokensAmount = weiAmount.mul(exchangeRateIco);
            if (tokensAmount > tokensRemainingIco) {
                uint256 weiToAccept = tokensRemainingIco.div(exchangeRateIco);
                excessiveFunds = excessiveFunds.add(weiAmount.sub(weiToAccept));
                tokensAmount = tokensRemainingIco;
                weiAmount = weiToAccept;
            }
            investments[msg.sender] = investments[msg.sender].add(weiAmount);
            tokensSoldIco = tokensSoldIco.add(tokensAmount);
            tokensSoldTotal = tokensSoldTotal.add(tokensAmount);
            tokensRemainingIco = tokensRemainingIco.sub(tokensAmount);
            weiRaisedIco = weiRaisedIco.add(weiAmount);
            weiRaisedTotal = weiRaisedTotal.add(weiAmount);
            token.transferFromIco(msg.sender, tokensAmount);
            if (excessiveFunds > 0) {
                msg.sender.transfer(excessiveFunds);
            }
        }
}