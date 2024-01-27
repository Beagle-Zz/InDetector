contract c18987{
    /// return current contract balance
    function getBalance() public view onlyCLevel returns (uint256) {
        return this.balance;
    }
}