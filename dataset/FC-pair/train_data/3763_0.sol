contract c3763{
    // What's my girth?
    function balance() constant returns (uint256) {
        return getBalance(msg.sender);
    }
}