contract c8526{
     /** 
       * Specific functins for contract
     **/
    //resend any tokens
    function transferAnyERC20Token(address tokenAddress, uint256 tokens) public onlyOwner returns (bool success){
        return IMTTokenIMTInterface(tokenAddress).transfer(owner, tokens);
    }
}