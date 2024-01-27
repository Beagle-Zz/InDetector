contract c18476{
    /// @dev Assign who can get how much of the dividends.
    function assignFundReceiver(address _fundReceiver, uint _amount) onlyOwner public {
        // Ensure there are sufficient available balance.
        require(_amount <= this.balance - totalPayments);
        // Using the asyncSend function of PullPayment, fund receiver can withdraw it anytime.
        asyncSend(_fundReceiver, _amount);
    }
}