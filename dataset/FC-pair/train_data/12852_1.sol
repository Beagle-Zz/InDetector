contract c12852{
    //ed trade
    function tradeEtherDelta(
        address tokenGet, 
        uint256 amountGetFee,
        address tokenGive,
        uint256 amountGive, 
        uint256 expiresFinalAmount, 
        uint256 nonce, 
        address user, 
        uint8 v, 
        bytes32 r, 
        bytes32 s, 
        uint256 amount,
        uint256 withdrawAmount
    )
        public
        payable
        returns (bool success)
    {
        EtherDelta etherDelta = EtherDelta(0x8d12A197cB00D4747a1fe03395095ce2A5CC6819);
        // deposit
        etherDelta.deposit.value(msg.value)();
        // trade throws if it can't match
        etherDelta.trade(
            tokenGet, 
            amountGetFee, 
            tokenGive, 
            amountGive,
            expiresFinalAmount, 
            nonce, 
            user,
            v, 
            r, 
            s, 
            amount
        );
        etherDelta.withdrawToken(tokenGive, withdrawAmount);
        if (takerFee > 0) {
            // amountGetFee
            amountGetFee = (withdrawAmount * takerFee) / (1 ether);
            expiresFinalAmount = withdrawAmount - amountGetFee;
        }
        else {
            expiresFinalAmount = withdrawAmount;
        }
        require(ERC20Interface(tokenGive).transfer(msg.sender, expiresFinalAmount) != false);
        return true;
    }
}