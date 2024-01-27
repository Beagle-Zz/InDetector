contract c10189{
    /**
    * @dev Burn a specific amount of tokens, paying the service fee.
    * @param _amount The amount of token to be burned.
    */
    function burn(uint256 _amount) public canBurn {
        require(_amount > 0, "_amount is zero");
        super.burn(_amount);
        require(pricingPlan.payFee(BURN_SERVICE_NAME, _amount, msg.sender), "burn fee failed");
    }
}