contract c11368{
    // allows to update tokens rate for owner
    function setPricingStrategy(IPricingStrategy _pricingStrategy) external onlyOwner returns (bool) {
        pricingStrategy = _pricingStrategy;
        return true;
    }
}