contract c4875{
    /**
    * @dev Borrow from the bank on behalf of an arbitrage contract and execute the arbitrage contract's callback function.
    * @param token Address of the token to borrow. 0x0 for Ether.
    * @param amount Amount to borrow.
    * @param dest Address of the account to receive arbitrage profits.
    * @param data The data to execute the arbitrage trade.
    */
    function borrow(
        address token,
        uint256 amount,
        address dest,
        bytes data
    )
        external
        nonReentrant
        isArbitrage(token, amount)
        returns (bool)
    {
        // Borrow from the bank and send to the arbitrageur.
        IBank(bank).borrowFor(token, msg.sender, amount);
        // Call the arbitrageur's execute arbitrage method.
        return IArbitrage(msg.sender).executeArbitrage(token, amount, dest, data);
    }
}