contract c12661{
    /**
     * Owner can start new token sale, to mint missing tokens by using this function,
     * but not more often than once per month.
     * @param _startTime start time for new token sale.
    */
    function startSale(uint256 _startTime) public onlyOwner {
        require (!isActive);
        require (_startTime > getNow());
        require (saleStartTime == 0 || _startTime.sub(saleStartTime) > 30 days);   // Minimum one month between token sales
        // Burn unburned sleep, family and personal time.
        sleepContract.burnTokens();
        uint256 sleepTokens = token.balanceOf(address(sleepContract));
        familyContract.burnTokens();
        uint256 familyTokens = token.balanceOf(familyContract).add(familyContract.debt());
        personalContract.burnTokens();
        uint256 personalTokens = token.balanceOf(personalContract).add(personalContract.debt());
        uint256 missingSleep = MAX_AMOUNT.div(100).mul(40).sub(sleepTokens);       // sleep and stuff takes 40% of Jaro time
        uint256 missingFamily = MAX_AMOUNT.div(100).mul(25).sub(familyTokens);     // 25% for family
        uint256 missingPersonal = MAX_AMOUNT.div(100).mul(15).sub(personalTokens); // 15% is Jaro personal time
        mint(address(sleepContract), missingSleep);
        mint(address(familyContract), missingFamily);
        mint(address(personalContract), missingPersonal);
        tokensToMint = MAX_AMOUNT.sub(token.totalSupply());
        saleStartTime = _startTime;
        isActive = true;
        emit SaleActivated(_startTime, tokensToMint);
    }
}