contract c10936{
    /**  
     @dev Withdraw tokens from the reserve
     */
    function withdrawTokens(uint amount) onlyOwner public {
        tokenContract.transfer(msg.sender, amount);
    }
}