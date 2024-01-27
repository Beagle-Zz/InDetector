contract c13035{
   /**
    *   @dev Allows investors to return their investments
    */
    function returnEther() public {
        uint256 eth = 0;
        uint256 tokens = 0;
        require(canIWithdraw);
        if (!isItIco) {
            require(!returnStatusPre[msg.sender]);
            require(preInvestments[msg.sender] > 0);
            eth = preInvestments[msg.sender];
            tokens = tokensPreIco[msg.sender];
            preInvestments[msg.sender] = 0;
            tokensPreIco[msg.sender] = 0;
            returnStatusPre[msg.sender] = true;
        }
        else {
            require(!returnStatusIco[msg.sender]);
            require(icoInvestments[msg.sender] > 0);
            eth = icoInvestments[msg.sender];
            tokens = tokensIco[msg.sender];
            icoInvestments[msg.sender] = 0;
            tokensIco[msg.sender] = 0;
            returnStatusIco[msg.sender] = true;
            soldTotal = soldTotal.sub(tokensNoBonusSold[msg.sender]);}
        LTO.burnTokens(msg.sender, tokens);
        msg.sender.transfer(eth);
        emit LogReturnEth(msg.sender, eth);
    }
}