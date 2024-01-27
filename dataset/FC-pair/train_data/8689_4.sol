contract c8689{
     /** 
       * Specific functins for contract
     **/
    //resend any tokens
    function transferAnyERC20Token(address tokenAddress, uint256 tokens) public onlyOwner returns (bool success){
        return IMoneyTokenIMTInterface(tokenAddress).transfer(owner, tokens);
    }
}