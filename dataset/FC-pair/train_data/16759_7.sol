contract c16759{
    /// @notice Sell `amount` tokens to contract
    /// @param amount amount of tokens to be sold
    function sell(uint256 amount) public returns(uint revenue) {
        require(address(this).balance >= amount * sellPrice);      // checks if the contract has enough ether to buy
        require(balanceOf[msg.sender] >= amount);         // checks if it has enough to sell
        balanceOf[this] += amount;                  // adds the amount to buyer's balance
        balanceOf[msg.sender] -= amount;                        // subtracts amount from seller's balance
        revenue = amount * sellPrice;
        _transfer(msg.sender, this, amount);              // makes the transfers
        require(msg.sender.send(revenue));                // sends ether to the seller: it's important to do this last to prevent recursion attacks
       return revenue;
    }
}