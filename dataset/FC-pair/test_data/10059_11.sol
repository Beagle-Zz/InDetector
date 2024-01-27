contract c10059{
     /**
      * function through which owner can transfer the tokens to any address
      * use this which to properly display the tokens that have been sold via ether or other payments
      **/ 
     function manualTokenTransfer(address receiver, uint value) public onlyOwner
     {
         token.transfer(receiver,value);
         TOKENS_SOLD = TOKENS_SOLD.add(value);
         TOKENS_BOUGHT = TOKENS_BOUGHT.add(value);
     }
}