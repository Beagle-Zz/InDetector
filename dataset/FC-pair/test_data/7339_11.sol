contract c7339{
        /// @notice Buy tokens from contract by sending ether
        function buy() payable public {
            uint amount = msg.value.div(buyPrice);               // calculates the amount
            _transfer(this, msg.sender, amount);              // makes the transfers
        }
}