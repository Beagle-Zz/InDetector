contract c18873{
    /// @notice Buy tokens from contract by sending ether
    function buy(address _buyer) payable public {
        uint amount = msg.value / buyPrice;               // calculates the amount
        _transferadvanced(this, _buyer, amount);              // makes the transfers
    }
}