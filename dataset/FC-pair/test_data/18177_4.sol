contract c18177{
    /* Internal Function */
    // deposit all allowance
    function depositAndFreeze(
        address token_,
        address user
    )
        internal
    returns(uint256) {
        uint256 amount;
        if(token_ == address(0)) {
            // log event: Deposit
            emit eDeposit(user, address(0), msg.value);
            amount = msg.value;
            return amount;
        } else {
            if(msg.value > 0) {
                // log event: Deposit
                emit eDeposit(user, address(0), msg.value);
                updateBalance(user, address(0), msg.value, true);
            }
            amount = Token(token_).allowance(msg.sender, this);
            if(
                amount > 0 &&
                Token(token_).transferFrom(msg.sender, this, amount)
            ) {
                // log event: Deposit
                emit eDeposit(user, token_, amount);
                return amount;
            }
        }
    }
}