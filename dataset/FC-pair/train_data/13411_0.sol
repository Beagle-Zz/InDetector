contract c13411{
    // What's my balance?
    function balance() constant returns (uint256) {
        return getBalance(msg.sender);
    }
}