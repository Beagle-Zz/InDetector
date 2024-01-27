contract c8093{
    /**
     * @dev Return total individual wei amount.
     * @param _beneficiary Addresses to get total wei amount .
     * @return Total wei amount for the address.
     */
    function getTotalIndividualWeiAmount(address _beneficiary) external view onlyOwnerOrAdmin returns (uint256) {
        return totalIndividualWeiAmount[_beneficiary];
    }
}