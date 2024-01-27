contract c12323{
  // overriding Crowdsale#validPurchase to add extra cap logic
  // @return true if investors can buy at the moment
  // removed view to be overriden
  function validPurchase() internal returns (bool) {
    bool withinCap = weiRaised.add(msg.value) <= cap;
    return super.validPurchase() && withinCap;
  }
}