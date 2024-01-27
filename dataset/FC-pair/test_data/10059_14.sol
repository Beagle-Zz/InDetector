contract c10059{
     /**
      * function to approve multiple users at once 
      * can only be called by the owner
      **/
     function approveMultipleUsers(address[] users) public onlyOwner {
         for (uint i=0;i<users.length;i++)
         {
            usersBuyingInformation[users[i]].isKYCApproved = true;    
         }
     }
}