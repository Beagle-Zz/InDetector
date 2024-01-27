contract c10189{
    /**
    * @dev Change the pricing plan of service fee to be paid in NOKU tokens.
    * @param _pricingPlan The pricing plan of NOKU token to be paid, zero means flat subscription.
    */
    function setPricingPlan(address _pricingPlan) public onlyServiceProvider {
        require(_pricingPlan != 0, "_pricingPlan is 0");
        require(_pricingPlan != address(pricingPlan), "_pricingPlan == pricingPlan");
        pricingPlan = NokuPricingPlan(_pricingPlan);
        emit LogPricingPlanChanged(msg.sender, _pricingPlan);
    }
}