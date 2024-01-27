contract c2005{
  /**
    @dev Change the payment token
    @param _paymentToken the Address of the token used for paymentToken
  **/
  function changePaymentToken(address _paymentToken) public isOwner {
    require(_paymentToken != 0x0);
    paymentToken = Token(_paymentToken);
    emit PaymentTokenChanged(_paymentToken);
  }
}