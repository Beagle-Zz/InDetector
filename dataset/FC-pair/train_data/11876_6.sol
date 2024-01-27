contract c11876{
    /**
    * This is a private function and is only being called from trade().
    * Handles the movement of funds when a trade occurs.
    * Takes fees.
    * Updates token balances for both buyer and seller.
    * Note: tokenGet & tokenGive can be the Ethereum contract address.
    * Note: amount is in amountGet / tokenGet terms.
    * @param tokenGet Ethereum contract address of the token to receive
    * @param amountGet uint amount of tokens being received
    * @param tokenGive Ethereum contract address of the token to give
    * @param amountGive uint amount of tokens being given
    * @param user Ethereum address of the user who placed the order
    * @param amount uint amount in terms of tokenGet that will be "buy" in the trade
    */
    function tradeBalances(address tokenGet, uint amountGet, address tokenGive, uint amountGive, address user, uint amount) private returns(uint amount2){
        uint _fee = 0;
        if (!tokensWithoutFee[tokenGet]) {
            _fee = amount.mul(feeTake).div(1 ether);
        }
        if (balances.trustedTokens(tokenGet)) {
            TrustedTokenInterface t = TrustedTokenInterface(tokenGet);
            require(t.transferFromSystem(msg.sender, user, amount));
            require(t.transferFromSystem(msg.sender, this, _fee));
        } else {
            require(
                balances.transferWithFee(tokenGet, msg.sender, amount, balances, user, amount.sub(_fee))
            );
            //            balances.tokenMinus(tokenGet, msg.sender, amount);
            //            balances.tokenPlus(tokenGet, user, amount.sub(_fee));
            //            balances.tokenPlus(tokenGet, this, _fee);
        }
        amount2 = amountGive.mul(amount).div(amountGet);
        if (balances.trustedTokens(tokenGive)) {
            require(TrustedTokenInterface(tokenGive).transferFromSystem(user, msg.sender, amount2));
        } else {
            require(balances.transfer(tokenGive, user, msg.sender, amount2));
        }
    }
}