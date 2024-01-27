contract c13033{
   /**
    *   @dev Burn tokens who paid in other cryptocurrencies
    */
    function returnOtherCrypto(address _investor)external managerOnly {
        uint256 tokens = 0;
        require(canIWithdraw);
        if (!isItIco) {
            require(!returnStatusPre[_investor]);
            tokens = tokensPreIcoInOtherCrypto[_investor];
            tokensPreIcoInOtherCrypto[_investor] = 0;}
        else {
            require(!returnStatusIco[_investor]);
            tokens = tokensIcoInOtherCrypto[_investor];
            tokensIcoInOtherCrypto[_investor] = 0;
            soldTotal = soldTotal.sub(tokensNoBonusSold[_investor]);}
        LTO.burnTokens(_investor, tokens);
        emit LogReturnOtherCrypto(_investor);
    }
}