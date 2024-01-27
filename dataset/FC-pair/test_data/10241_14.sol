contract c10241{
    /**
     * function to show how many animals does an address have
     **/
    function showMyAnimalBalance() public view returns (uint256 tokenBalance) 
    {
        tokenBalance = token.balanceOf(msg.sender);
    }
}