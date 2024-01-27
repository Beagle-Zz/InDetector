contract c10936{
    /**  
     @dev Withdraw ether from the reserve
     */
    function withdrawEther(uint amountInWei) onlyOwner public {
        msg.sender.transfer(amountInWei); //Transfers in wei
    }
}