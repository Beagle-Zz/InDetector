contract c16378{
    // Get the owners token balance
    function getOwnerBalance(address token) public view returns (uint256) {
        return balances[msg.sender][token];
    }
}