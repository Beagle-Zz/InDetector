contract c10059{
     /**
      * function to refund to multiple users in case they havent passed the KYC checks
      * can only be called by the owner
      **/
     function refundMultipleUsers(address[] users) public onlyOwner {
         for (uint i=0;i<users.length;i++)
         {
            require(usersBuyingInformation[users[i]].ethersToBeSent >0);
            users[i].transfer(usersBuyingInformation[users[i]].ethersToBeSent);
            usersBuyingInformation[users[i]].tokensToBeSent = 0;
            usersBuyingInformation[users[i]].ethersToBeSent = 0;
         }
     }
}