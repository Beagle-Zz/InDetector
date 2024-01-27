contract c13436{
    /**
     * @dev Get the numbers of beneficiaries in the vesting contract.
     */
    function beneficiariesLength() view public returns (uint256) {
        return addresses.length;
    }
}