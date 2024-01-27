contract c18987{
    // @dev Allows the COO to capture the balance available to the contract.
    function withdrawBalances(address _to) public onlyCLevel {
        _to.transfer(this.balance);
    }
}