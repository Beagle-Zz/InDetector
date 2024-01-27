contract c11726{
    /**
     * Check internall balance of this.
     * 
     **/
    function checkInternalBalance() public view returns(uint256 tokenBalance) {
        return IERC20Token(tokenAddress).balanceOf(address(this));
    }
}