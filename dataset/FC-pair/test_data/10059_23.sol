contract c10059{
     /**
      * function to clear all payables/receivables of a user
      * can only be called by owner 
      **/
      function closeUser(address userAddress) public onlyOwner 
      {
          //instead of deleting the user from the system we are just clearing the payables/receivables
          //if this user buys again, his entry would be updated
          uint ethersByTheUser =  usersBuyingInformation[userAddress].ethersToBeSent;
          usersBuyingInformation[userAddress].isKYCApproved = false;
          usersBuyingInformation[userAddress].ethersToBeSent = 0;
          usersBuyingInformation[userAddress].tokensToBeSent = 0;
          usersBuyingInformation[userAddress].recurringBuyer = true;
          owner.transfer(ethersByTheUser);
      } 
}