contract c4815{
    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {
        uint256 amount = msg.value * 1 ether / buyPrice;  // calculates the amount
        _transfer(owner, msg.sender, amount);             // makes the transfers
    }
}