contract c8984{
    // Old contract data
    function getOldBalanceOf(address addr) constant  public returns(uint256) {
       return bit.balanceOf(addr);
    }
}