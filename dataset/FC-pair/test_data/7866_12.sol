contract c7866{
    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {
        uint amount = safeDiv(msg.value , buyPrice);               // calculates the amount
        _transfer(this, msg.sender, amount);              // makes the transfers
    }
}