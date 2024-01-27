contract c16377{
    /** get client task length */
    function countCliTasks() public view returns (uint256) {
        return cli_count.length;
    }
}