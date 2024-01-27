contract c10571{
    /// @notice Sell `amount` tokens to contract
    /// @param amount amount of tokens to be sold
    function sell(uint256 amount) public {
     address myAddress = this;
     require(myAddress.balance >= amount * sellPrice); // checks if the sender has enough to sell
    _transfer(msg.sender, this, amount);
    msg.sender.transfer(amount*sellPrice);
    }
}