contract c2485{
    /**
     * @notice This function returns the signature of configure function
     */
    function getInitFunction() public pure returns (bytes4) {
        return bytes4(keccak256("configure(uint256)"));
    }
}