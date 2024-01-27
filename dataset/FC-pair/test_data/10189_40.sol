contract c10189{
    /**
    * @dev Mint a specific amount of tokens, paying the service fee.
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function mint(address _to, uint256 _amount) public onlyOwner canMint returns(bool minted) {
        require(_to != 0, "_to is zero");
        require(_amount > 0, "_amount is zero");
        super.mint(_to, _amount);
        if (mintingFeeEnabled) {
            require(pricingPlan.payFee(MINT_SERVICE_NAME, _amount, msg.sender), "mint fee failed");
        }
        return true;
    }
}