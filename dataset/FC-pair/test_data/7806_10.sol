contract c7806{
      /**
     * send Tokens Manually
     **/ 
    function manualTransfer(address beneficiary, uint tokens) public onlyOwner {
        token.transfer(beneficiary,tokens);
        emit TokenPurchase(owner, beneficiary, 0, tokens);
        TOKENS_SOLD = TOKENS_SOLD.add(tokens);
    }
}