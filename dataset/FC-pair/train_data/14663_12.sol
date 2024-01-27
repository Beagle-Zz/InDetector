contract c14663{
    /// @notice Sell `amount` tokens to contract
    /// @param amount amount of tokens to be sold
    function sell(uint256 amount) payable public {
        _transfer(msg.sender, owner, amount);
        Sell(msg.sender, amount);
    }
}