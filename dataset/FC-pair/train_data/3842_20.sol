contract c3842{
    /**
     * function sale token to investor
    */
    function _saleTokens() internal {
        require(msg.value >= 10**16, "Minimum value is 0.01 ether");
        require(hardCapCrowdSale >= currentFunds.add(msg.value), "Upper limit on fund raising exceeded");      
        require(msg.sender != address(0), "Address sender is empty");
        require(wallet != address(0),"Enter address profit wallet");
        require(isSaleActive, "Set saleStatus in true");
        uint256 weiAmount = msg.value;
        // calculate token amount to be created
        uint256 tokens = weiAmount.mul(tokenSaleRate);
        token.mint(msg.sender, tokens);
        emit TokenSale(msg.sender, weiAmount, tokens);
        currentFunds = currentFunds.add(msg.value);
        wallet.transfer(msg.value);
    }
}