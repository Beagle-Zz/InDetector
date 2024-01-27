contract c2755{
    /**
     * @dev Defines the abstract function from `BaseFundraiser` to add the funds to the `refundSafe`
     */
    function handleFunds(address _address, uint256 _ethers) internal {
        refundSafe.deposit.value(_ethers)(_address);
    }
}