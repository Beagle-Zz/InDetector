contract c8613{
   /**
    * @dev function for cancel deal (accessable ony for signer of current deal)
    * @param _dealNumber (deal number)
    */
    function cancelDeal(uint _dealNumber) onlySigner(_dealNumber) public{
        uint deal = dealNumbers[_dealNumber];
       require(deals[deal].balance > 0 &&  deals[deal].status == statuses.signed);
       deals[deal].buyer.transfer(deals[deal].balance);
       emit MoneyTransfer(this,deals[deal].buyer,deals[deal].balance);
       deals[deal].balance = 0;
       deals[deal].status = statuses.canceled;
       deals[deal].atClosed = now;
   }
}