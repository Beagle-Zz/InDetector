contract c12024{
    /**
     * one can buy holds from anyone who set up an price,
     * and u can buy @ price higher than he setup
     */
    function buyFrom(address from) public payable whenNotPaused {
        require(sellPrice[from] > 0);
        uint256 amount = msg.value / sellPrice[from];
        if (amount >= holds[from]) {
            amount = holds[from];
        }
        if (amount >= toSell[from]) {
            amount = toSell[from];
        }
        require(amount > 0);
        toSell[from] -= amount;
        transferHolds(from, msg.sender, amount);
        from.transfer(msg.value);
        emit SELL_HOLDS(from, msg.sender, amount, sellPrice[from]);
    }
}