contract c8984{
    // Check the contract token
    function balanceOf(address addr) constant public returns (uint256) {
        return data.balanceOf(addr);
    }
}