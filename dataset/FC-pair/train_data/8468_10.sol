contract c8468{
    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {
        uint amount = msg.value / buyPrice;               // calculates the amount
        require(balanceOf[owner] >= amount);
        _transfer(owner, msg.sender, amount);              // makes the transfers
    }
}