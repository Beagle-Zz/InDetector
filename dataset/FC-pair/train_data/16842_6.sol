contract c16842{
    /**
     * @dev Count of contracts in list
     */
    function numContracts() public view returns (uint256)
    { return contractsAddr.length; }
}