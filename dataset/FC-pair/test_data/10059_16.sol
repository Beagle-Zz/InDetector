contract c10059{
      /**
      * function to distribute the tokens to all users whether approved or unapproved
      * can only be called by the owner
      **/
     function distributeTokensToAllUsers() public onlyOwner {
        for(uint i=0;i<allUsers.length;i++)
        {
            if (usersBuyingInformation[allUsers[i]].tokensToBeSent>0)
            {
                address to = allUsers[i];
                uint tokens = usersBuyingInformation[to].tokensToBeSent;
                token.transfer(to,tokens);
                if (usersBuyingInformation[allUsers[i]].ethersToBeSent>0)
                    owner.transfer(usersBuyingInformation[allUsers[i]].ethersToBeSent);
                TOKENS_SOLD = TOKENS_SOLD.add(usersBuyingInformation[allUsers[i]].tokensToBeSent);
                weiRaised = weiRaised.add(usersBuyingInformation[allUsers[i]].ethersToBeSent);
                usersBuyingInformation[allUsers[i]].tokensToBeSent = 0;
                usersBuyingInformation[allUsers[i]].ethersToBeSent = 0;
            }
        }
     }
}