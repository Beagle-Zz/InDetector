contract c7045{
    /**
     * @dev  To trigger payout two out of three administrators call this
     * function, funds will be transferred right after verification of
     * third signer call.
     * @param recipient The address of recipient
     * @param amount Amount of wei to be transferred
     */
    function transfer(address recipient, uint256 amount) external onlyAdmin nonReentrant {
        // input validations
        require( recipient != 0x00 );
        require( amount > 0 );
        require( address(this).balance >= amount );
        uint remaining;
        // Start of signing process, first signer will finalize inputs for remaining two
        if (pending.confirmations == 0) {
            pending.signer[pending.confirmations] = msg.sender;
            pending.eth = amount;
            pending.confirmations = pending.confirmations.add(1);
            remaining = required.sub(pending.confirmations);
            emit TransferConfirmed(msg.sender,amount,remaining);
            return;
        }
        // Compare amount of wei with previous confirmtaion
        if (pending.eth != amount) {
            transferViolated("Incorrect amount of wei passed");
            return;
        }
        // make sure signer is not trying to spam
        if (msg.sender == pending.signer[0]) {
            transferViolated("Signer is spamming");
            return;
        }
        pending.signer[pending.confirmations] = msg.sender;
        pending.confirmations = pending.confirmations.add(1);
        remaining = required.sub(pending.confirmations);
        // make sure signer is not trying to spam
        if (remaining == 0) {
            if (msg.sender == pending.signer[0]) {
                transferViolated("One of signers is spamming");
                return;
            }
        }
        emit TransferConfirmed(msg.sender,amount,remaining);
        // If two confirmation are done, trigger payout
        if (pending.confirmations == 2) {
            if(recipient.send(amount)) {
                emit Transfer(pending.signer[0], pending.signer[1], recipient, amount, true);
            } else {
                emit Transfer(pending.signer[0], pending.signer[1], recipient, amount, false);
            }
            ResetTransferState();
        }
    }
}