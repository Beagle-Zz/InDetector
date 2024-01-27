contract c8358{
    /**
     * @dev Check the amount of grants that an address has.
     * @param _holder The holder of the grants.
     * @return A uint representing the total amount of grants.
     */
    function tokenGrantsCount(address _holder) public view returns (uint index) {
        return grants[_holder].length;
    }
}