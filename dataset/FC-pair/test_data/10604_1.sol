contract c10604{
    /*
        @return All the "hotwallet" accounts, it must have at least one.
    */
    function allAccounts() public view returns (address[]) {
        return accounts;
    }
}