contract c7487{
    /// @dev called by the owner to pause the contract. Triggers a stopped state 
    ///  and resets allowDisbursePaymentWhenPaused to false
    function pause() onlyOwner whenNotPaused public {
        allowDisbursePaymentWhenPaused = false;
        super.pause();
    }
}