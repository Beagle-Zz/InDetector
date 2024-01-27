contract c10442{
    // This function is called directly by users who wish to transfer tokens
    function transfer(address _to, uint256 _value) canTransfer(_to) public returns (bool) {
        // Call underlying transfer method and pass in the sender address
        transferBasic(msg.sender, _to, _value);
        return true;
    }
}