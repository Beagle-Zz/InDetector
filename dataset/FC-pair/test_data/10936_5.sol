contract c10936{
    // The following methods are for the owner and admins to manage the Exchanger
    /**
     @dev Deposit tokens to the reserve.
     */
    function depositTokens(uint amount) onlyOwner public {
        tokenContract.transferFrom(msg.sender, this, amount);
    }
}