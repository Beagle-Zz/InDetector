contract c1815{
    // Public functions
    function totalInVaults() public constant returns (uint256 amount) {
        return inVaults;
    }
}