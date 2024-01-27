contract c10469{
    /// @notice Sells aToken in exchnage for wei at the current bid 
    /// price, reduces resreve
    /// @return Proceeds of wei from sale of aToken
    function sell(uint amount) public returns (uint revenue){
        require(initialSaleComplete);
        require(balances[msg.sender] >= bid);            // checks if the sender has enough to sell
        balances[reserveAddress] += amount;                        // adds the amount to owner's balance
        balances[msg.sender] -= amount;                  // subtracts the amount from seller's balance
        revenue = amount * bid;
        require(msg.sender.send(revenue));                // sends ether to the seller: it's important to do this last to prevent recursion attacks
        emit Transfer(msg.sender, reserveAddress, amount);               // executes an event reflecting on the change
        return revenue;                                   // ends function and returns
    }    
}