contract c13633{
  /**
   * Allow to (re)set pricing strategy.
   *
   * Design choice: no state restrictions on the set, so that we can fix fat finger mistakes.
   */
  function setPricingStrategy(PricingStrategy _pricingStrategy) onlyOwner {
    pricingStrategy = _pricingStrategy;
    // Don't allow setting bad agent
    if(!pricingStrategy.isPricingStrategy()) {
      throw;
    }
  }
}