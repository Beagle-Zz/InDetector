contract c2357{
    // This is a standard function required for ERC223 compatibility.
    function tokenFallback (address from, uint value, bytes data) public {
        emit ERC223Received (from, value);
    }
}