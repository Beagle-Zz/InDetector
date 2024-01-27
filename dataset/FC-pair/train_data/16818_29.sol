contract c16818{
    /**
     * View the total balance of the token contract
     */
    function tokenContractBalance() public view returns (uint256) {
        return CryptoTorchToken_.contractBalance();
    }
}