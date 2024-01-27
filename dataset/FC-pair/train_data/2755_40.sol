contract c2755{
    /**
     * @dev Refunds a participant in the fundraiser.
     *
     * @param _address The address of the participant.
     */
    function refund(address _address) public {
        require(state == State.REFUNDING);
        uint256 amount = deposits[_address];
        // We do not want to emit RefundSuccessful events for empty accounts with zero ether
        require(amount != 0);
        // Zeroing the deposit early prevents reentrancy issues
        deposits[_address] = 0;
        _address.transfer(amount);
        emit RefundSuccessful(_address, amount);
    }
}