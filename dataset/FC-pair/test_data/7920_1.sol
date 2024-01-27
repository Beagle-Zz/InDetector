contract c7920{
    // Extra function
    function myBalance() public view returns (uint balance) {
        return balances[msg.sender];
    }
}