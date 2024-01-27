contract c10389{
    /// @notice Buy tokens from contract by sending ether
    function buy() payable onlyOwner public {
        uint amount = msg.value / buyPrice;               // calculates the amount
        _transfer(this, msg.sender, amount);              // makes the transfers
    }
}