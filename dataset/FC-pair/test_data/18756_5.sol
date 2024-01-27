contract c18756{
    // calculate value of MTC that can be redeemed from the ETH
    function redeem(uint256 _mtcTokens) public {
        if (msg.sender != owner) {
            require(redeemBool);
            token tokenBalance = token(tokenAddress);
            tokenBalance.redeemToken(_mtcTokens, msg.sender);
            uint256 weiVal = (_mtcTokens * redeemRate);
            ethRedeemed += weiVal;                                  // adds the value of transferred ETH to the redeemed ETH till now
            // it need to stay last for reentery attack purpose
            msg.sender.transfer(weiVal);                            // transfer the amount of ETH
        }
    }
}