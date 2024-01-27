contract c16875{
    //
    // Helper Functions
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //
    /**
     * View the total balance of this contract
     */
    function torchContractBalance() public view returns (uint256) {
        return this.balance;
    }
}