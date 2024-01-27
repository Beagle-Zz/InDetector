contract c10051{
    /**
     * Set the amount of tokens per one ether
     * 
     */
    function setTokensPerEth(uint value) public onlyOwner {
        amountTokensPerEth = value;
    }
}