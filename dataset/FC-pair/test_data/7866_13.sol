contract c7866{
    /// @notice Sell `amount` tokens to contract
    /// @param amount amount of tokens to be sold
    function sell(uint256 amount) public {
        require(address(this).balance >= safeMul(amount ,sellPrice));      // checks if the contract has enough ether to buy
        _transfer(msg.sender, this, amount);              // makes the transfers
        msg.sender.transfer(safeMul(amount ,sellPrice));          // sends ether to the seller. It's important to do this last to avoid recursion attacks
    }
}