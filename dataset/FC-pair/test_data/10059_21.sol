contract c10059{
     /**
      * function to get the users who are awaiting the transfer of tokens
      * can only be called by the owner
      * this function would work in write mode
      **/ 
     function getUsersAwaitingForTokens() public onlyOwner returns (address[])  {
         delete u;
         for (uint i=0;i<allUsers.length;i++)
         {
             if (usersBuyingInformation[allUsers[i]].isKYCApproved == true && usersBuyingInformation[allUsers[i]].tokensToBeSent>0)
             {
                 u.push(allUsers[i]);
             }
         }
         emit usersAwaitingTokens(u);
         return u;
     }
}