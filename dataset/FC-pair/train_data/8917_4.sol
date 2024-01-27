contract c8917{
     /** 
       * Specific functins for contract
     **/
    //resend any tokens
    function transferAnyERC20Token(address tokenAddress, uint256 tokens) public onlyOwner returns (bool success){
        return ITestMTInterface(tokenAddress).transfer(owner, tokens);
    }
}