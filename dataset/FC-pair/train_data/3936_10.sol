contract c3936{
  /**
   * @dev transfers IXT 
   * @param from User address
   * @param to Recipient
   * @param action Service the user is paying for 
   */
  function transferIXT(address from, address to, string action) public allowedOnly isNotPaused returns (bool) {
    if (isOldVersion) {
      IXTPaymentContract newContract = IXTPaymentContract(nextContract);
      return newContract.transferIXT(from, to, action);
    } else {
      uint price = actionPrices[action];
      if(price != 0 && !tokenContract.transferFrom(from, to, price)){
        return false;
      } else {
        emit IXTPayment(from, to, price, action);     
        return true;
      }
    }
  }
}