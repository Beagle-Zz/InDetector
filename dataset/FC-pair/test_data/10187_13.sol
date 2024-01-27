contract c10187{
    /**
     * @dev Low level token purchase function
     * @param beneficiary the wallet to which the investment should be credited
     */
    function buyTokens(address beneficiary) public whenNotPaused payable {
        require(beneficiary != address(0));
        require(validPurchase());
        uint256 weiAmount = msg.value;
        // track how much wei is raised in total
        weiRaised = weiRaised.add(weiAmount);
        // track how much was transfered by the specific investor
        investments[beneficiary] = investments[beneficiary].add(weiAmount);
        emit Investment(msg.sender, beneficiary, weiAmount, msg.data);
        forwardFunds();
    }
}