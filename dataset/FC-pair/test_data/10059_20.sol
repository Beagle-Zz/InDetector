contract c10059{
     /**
      * function to get the top 150 users who are awaiting the transfer of tokens
      * can only be called by the owner
      * this function would work in read mode
      **/ 
     function getUsersAwaitingForTokensTop150(bool fetch) public constant returns (address[150])  {
          address[150] memory awaiting;
         uint k = 0;
         for (uint i=0;i<allUsers.length;i++)
         {
             if (usersBuyingInformation[allUsers[i]].isKYCApproved == true && usersBuyingInformation[allUsers[i]].tokensToBeSent>0)
             {
                 awaiting[k] = allUsers[i];
                 k = k.add(1);
                 if (k==150)
                    return awaiting;
             }
         }
         return awaiting;
     }
}