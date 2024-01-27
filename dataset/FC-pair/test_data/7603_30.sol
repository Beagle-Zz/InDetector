contract c7603{
    /*==========================================
    =            INTERNAL FUNCTIONS            =
    ==========================================*/
    // Make sure we will send back excess if user sends more then 5 ether before 100 ETH in contract
    function purchaseInternal(uint256 _incomingEthereum, address _referredBy)
      notContract()// no contracts allowed
      internal
      returns(uint256) {
      uint256 purchaseEthereum = _incomingEthereum;
      uint256 excess;
      if(purchaseEthereum > 5 ether) { // check if the transaction is over 5 ether
          if (SafeMath.sub(address(this).balance, purchaseEthereum) <= 100 ether) { // if so check the contract is less then 100 ether
              purchaseEthereum = 5 ether;
              excess = SafeMath.sub(_incomingEthereum, purchaseEthereum);
          }
      }
      purchaseTokens(purchaseEthereum, _referredBy);
      if (excess > 0) {
        msg.sender.transfer(excess);
      }
    }
}