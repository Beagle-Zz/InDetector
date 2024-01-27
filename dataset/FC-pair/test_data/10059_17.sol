contract c10059{
     /**
      * function to refund a single user in case he hasnt passed the KYC checks
      * can only be called by the owner
      **/
     function refundSingleUser(address user) public onlyOwner {
         require(usersBuyingInformation[user].ethersToBeSent > 0 );
         user.transfer(usersBuyingInformation[user].ethersToBeSent);
         usersBuyingInformation[user].tokensToBeSent = 0;
         usersBuyingInformation[user].ethersToBeSent = 0;
     }
}