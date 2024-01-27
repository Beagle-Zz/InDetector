contract c8683{
    // @notice Buy tokens from contract by sending ether
    function buy() payable public {
        require(now > 1543536000); // seconds since 01.01.1970 to 30.11.2018 (18:00:00 o'clock GMT)
        uint amount = msg.value.div(buyPrice);       // calculates the amount
        _transfer(owner, msg.sender, amount);   // makes the transfers
    }
}