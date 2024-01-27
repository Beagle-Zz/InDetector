contract c16435{
    /*=====================================
    =      HELPERS AND CALCULATORS        =
    =====================================*/
    /**
     * @dev Method to view the current Ethereum stored in the contract
     *  Example: totalEthereumBalance()
     */
    function totalEthereumBalance() public view returns (uint) {
        return this.balance;
    }
}