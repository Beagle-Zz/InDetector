contract c13187{
    // Extra function
    function myBalance() public view returns (uint balance) {
        return balances[msg.sender];
    }
}