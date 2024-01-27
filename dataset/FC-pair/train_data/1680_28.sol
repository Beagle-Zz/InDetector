contract c1680{
    /** @dev transfer request
      * @param _to address to which the tokens have to be transferred
      * @param _value amount of tokens to be transferred
      */
    function transfer(address _to, uint256 _value)
        public
        checkIsInvestorApproved(msg.sender)
        checkIsInvestorApproved(_to)
        checkIsValueValid(_value)
        returns (bool)
    {
        uint256 pendingAmount = pendingApprovalAmount[msg.sender][address(0)];
        if (msg.sender == feeRecipient) {
            require(_value.add(pendingAmount) <= balances[msg.sender]);
            pendingApprovalAmount[msg.sender][address(0)] = pendingAmount.add(_value);
        } else {
            require(_value.add(pendingAmount).add(transferFee) <= balances[msg.sender]);
            pendingApprovalAmount[msg.sender][address(0)] = pendingAmount.add(_value).add(transferFee);
        }
        pendingTransactions[currentNonce] = TransactionStruct(
            msg.sender,
            _to,
            _value,
            transferFee,
            address(0)
        );
        emit RecordedPendingTransaction(msg.sender, _to, _value, transferFee, address(0));
        currentNonce++;
        return true;
    }
}