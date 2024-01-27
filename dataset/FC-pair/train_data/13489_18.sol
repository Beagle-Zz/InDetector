contract c13489{
    /** 
     *  @dev withdrawBalance from the contract address
     *  @param amount that you want to withdrawBalance
     * 
     */
    function withdrawBalance(uint256 amount) onlyOwner returns(bool) {
        require(amount <= address(this).balance);
        owner.transfer(amount);
        return true;
    }
}