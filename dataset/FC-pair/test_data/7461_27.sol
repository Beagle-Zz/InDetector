contract c7461{
    /// Owner can allow payment disbursement when the contract is paused. This is so the
    /// bridge can be upgraded without having to migrate any existing authorizedPayments
    /// @dev only callable whenPaused b/c pausing the contract will reset `allowDisbursePaymentWhenPaused` to false
    /// @param allowed `true` if allowing payments to be disbursed when paused, otherwise 'false'
    function setAllowDisbursePaymentWhenPaused(bool allowed) onlyOwner whenPaused public {
        allowDisbursePaymentWhenPaused = allowed;
    }
}