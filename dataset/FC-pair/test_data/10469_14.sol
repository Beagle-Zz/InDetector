contract c10469{
    /// @notice Buys aToken in exchnage for wei at the current ask price
    /// @return refunds remainder of wei from purchase   
    function buy() public payable returns (uint256 amount){
        uint256 refund = 0;
        debugVal = 0;
        if(initialSaleComplete)
        {
            uint256 units_to_buy = 0;
            uint256 etherRemaining = msg.value;             // (wei)
            uint256 etherToReserve = 0;                     // (wei)
            debugVal = fracExp(S, R, (_totalSupply/1e18),P);
            debugVal2 = RS*msg.value;
            debugVal3 = RS*msg.value/1e18 + fracExp(S, R, (_totalSupply/1e18),P);
            debugVal4 = (ln(debugVal3,1)-lnS);//*lnR-1;
            units_to_buy = debugVal4;
            reserveAddress.transfer(etherToReserve);        // send the ask amount to the reserve
            mintToken(msg.sender, amount);                  // Mint the coin
            refund = etherRemaining;
            msg.sender.transfer(refund);                    // Issue refund            
        }
        else
        {
            // TODO don't sell more than the ICO amount if one transaction is huge
            ask = ICOask;                                   // ICO sale price (wei/Token)
            amount = 1e18*msg.value / ask;                  // calculates the amount of aToken (1e18*wei/(wei/Token))
            refund = msg.value - (amount*ask/1e18);         // calculate refund (wei)
            // TODO test for overflow attack
            reserveAddress.transfer(msg.value - refund);    // send the full amount of the sale to reserve
            msg.sender.transfer(refund);                    // Issue refund
            balances[reserveAddress] += msg.value-refund;  // All other addresses hold Token Coin, reserveAddress represents ether
            mintToken(msg.sender, amount);                  // Mint the coin (aToken)
            if(_totalSupply >= ICOAmount)
            {
                initialSaleComplete = true;
            }             
        }
        return amount;                                    // ends function and returns
    }
}