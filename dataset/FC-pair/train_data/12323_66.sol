contract c12323{
  /**
  * @dev Override of the goalReached function in order to add presale weis to crowdsale weis and check if the total amount has reached the soft cap.
  * @return true if soft cap has been reached ; false otherwise
  **/
  function goalReached()
      public
      constant
      returns (bool)
  {
      uint256 totalWeiRaised = weiRaisedPreSale.add(weiRaised);
      return totalWeiRaised >= goal || super.goalReached();
  }
}