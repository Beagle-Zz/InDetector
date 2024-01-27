contract c10059{
       /**
      * function to get a list of all users that are unapproved
      * can only be called by owner
      * this function would work in write mode
      **/
      function getUnapprovedUsers() public onlyOwner returns (address[]) 
      {
         delete u;
         for (uint i=0;i<allUsers.length;i++)
         {
             if (usersBuyingInformation[allUsers[i]].isKYCApproved == false)
             {
                 u.push(allUsers[i]);
             }
         }
         emit usersAwaitingTokens(u);
         return u;
      } 
}