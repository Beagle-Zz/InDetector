contract c16818{
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