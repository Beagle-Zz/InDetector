contract c16867{
   /**
    * @dev This is separated as a function because it can be called separately to avoid costs as it is view only
    * @param _currency currency symbol
    * @return the amount of funds externally raised in the given currency
    */
    function getExternalFundsRaised(string _currency) public view returns(uint256) {
      return externalFundsRaised[currencyToHash(_currency)];
    }
}