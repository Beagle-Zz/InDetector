contract c2368{
    // Shows the total supply of token on the ethereum blockchain
    function Supply() public constant returns (uint) {
        return totalSupply  - balanceOf[address(0)]; // totalSupply excluding the burnt tokens
    }
}