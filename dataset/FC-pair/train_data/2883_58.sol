contract c2883{
    /// @notice withdraw all ether for oraclize payments
    /// @param to Address to send ether to
    function withdrawEther(address to)
        public
        validAddress(to)
        onlymanyowners(keccak256(msg.data))
    {
        to.transfer(this.balance);
    }
}