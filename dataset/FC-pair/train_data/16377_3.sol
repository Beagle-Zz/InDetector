contract c16377{
    /** get client task length */
    function countCliManagers() public view returns (uint256) {
        return cr_count.length;
    }
}