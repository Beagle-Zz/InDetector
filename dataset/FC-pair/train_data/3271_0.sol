contract c3271{
    // Deposit Funds
    function hodl() payable public {
        hodlers[msg.sender] += msg.value;
        emit Hodl(msg.sender, msg.value);
    }
}