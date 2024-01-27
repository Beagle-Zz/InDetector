contract c7960{
    /**
     * @dev Forward funds directly to beneficiary
     */
    function handleFunds(address, uint256 _ethers) internal {
        // Forward the funds directly to the beneficiary
        beneficiary.transfer(_ethers);
    }
}