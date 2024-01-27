contract c8613{
   /**
    * @dev function for sign in end of the deal (for finis need 2 sign from 3)
    * @param _dealNumber (deal number)
    */
   function finishDeal(uint _dealNumber)  public{
       uint deal = dealNumbers[_dealNumber];
       require(deals[deal].balance > 0 &&  deals[deal].status == statuses.signed );
       //SIGNING.....
       if(msg.sender == deals[deal].buyer){
           signs[deal].finishSignBuyer = msg.sender;
       }
      if(msg.sender == deals[deal].seller){
           signs[deal].finishSignSeller = msg.sender;
       }
       if(msg.sender ==deals[deal].signer){
            signs[deal].finishSignSigner = msg.sender;
       }
       //////////////////////////
      uint signCount = 0;
       if(deals[deal].buyer == signs[deal].finishSignBuyer){
           signCount++;
       }
        if(deals[deal].seller == signs[deal].finishSignSeller){
           signCount++;
       }
        if(deals[deal].signer == signs[deal].finishSignSigner){
           signCount++;
       }
       if(signCount >= 2){
         //transfer fund to seller
          deals[deal].seller.transfer(deals[deal].sum - deals[deal].fee);
           emit MoneyTransfer(this,deals[deal].seller,deals[deal].sum-deals[deal].fee);
           //transer fund to agency (fee)
           agencyReceiver.transfer(deals[deal].fee);
           emit MoneyTransfer(this,agencyReceiver,deals[deal].fee);
           deals[deal].balance = 0;
           deals[deal].status = statuses.finished;
           deals[deal].atClosed = now;
       }
   }
}