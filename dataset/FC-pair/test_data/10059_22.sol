contract c10059{
     /**
      * function to return the information of a single user
      **/ 
     function getUserInfo(address userAddress) public constant returns(uint _ethers, uint _tokens, bool _isApproved)
     {
         _ethers = usersBuyingInformation[userAddress].ethersToBeSent;
         _tokens = usersBuyingInformation[userAddress].tokensToBeSent;
         _isApproved = usersBuyingInformation[userAddress].isKYCApproved;
         return(_ethers,_tokens,_isApproved);
     }
}