contract c28{
    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {
        uint amount = msg.value / buyPrice;          
        _transfer(this, msg.sender, amount);
    }
}