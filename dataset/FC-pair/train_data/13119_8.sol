contract c13119{
    /*=====================================
    =      HELPERS AND CALCULATORS        =
    =====================================*/
    /**
     * @dev Method to view the current Ethereum stored in the contract
     *  Example: totalEthereumBalance()
     */
    function totalEthereumBalance() public view returns (uint256) {
        return address(this).balance;
    }
}