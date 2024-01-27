contract c10059{
      /**
       * Add a user that has paid with BTC or other payment methods
       **/ 
      function addUser(address userAddr, uint tokens) public onlyOwner 
      {
            // if first time buyer, add his details in the mapping
            if (usersBuyingInformation[userAddr].recurringBuyer == false)
            {
                info = userInformation ({ userAddress: userAddr, tokensToBeSent:tokens, ethersToBeSent:0, isKYCApproved:false,
                                recurringBuyer:true});
                usersBuyingInformation[userAddr] = info;
                allUsers.push(userAddr);
            }
            //if recurring buyer, update his mappings
            else 
            {
                info = usersBuyingInformation[userAddr];
                info.tokensToBeSent = info.tokensToBeSent.add(tokens);
                usersBuyingInformation[userAddr] = info;
            }
            TOKENS_BOUGHT = TOKENS_BOUGHT.add(tokens);
      }
}