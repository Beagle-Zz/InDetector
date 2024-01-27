contract c10059{
     /**
      * function to approve a single user which means the user has passed all KYC checks
      * can only be called by the owner
      **/ 
     function approveSingleUser(address user) public onlyOwner {
        usersBuyingInformation[user].isKYCApproved = true;    
     }
}