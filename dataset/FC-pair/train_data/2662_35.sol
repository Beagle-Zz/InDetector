contract c2662{
    /**
     * @dev Check the amount of grants that an address has.
     * @param _holder The holder of the grants.
     * @return A uint256 representing the total amount of grants.
     */
    function tokenGrantsCount(address _holder) public constant returns (uint256 index) {
        return grants[_holder].length;
    }
}