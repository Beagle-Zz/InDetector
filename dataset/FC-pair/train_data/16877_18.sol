contract c16877{
    //
    // Helper Functions
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //
    /**
     * View the total balance of the contract
     */
    function contractBalance() public view returns (uint256) {
        return this.balance;
    }
}