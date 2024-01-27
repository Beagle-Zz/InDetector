contract c18780{
    /// @notice Withdraw any accumulated fees to the specified address
    /// @param addr The address to which the balance should be sent
    function withdraw(address addr) 
        onlyOwner 
    public {
        addr.transfer(this.balance); 
    }
}