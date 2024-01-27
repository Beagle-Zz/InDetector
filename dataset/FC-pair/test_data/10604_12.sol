contract c10604{
    /*
        @notice Loads the token balance of all the accounts
    */
    function loadTokenBalances(Token token) public view returns (uint256[] memory, uint256 total) {
        uint256[] memory result = new uint256[](accounts.length);
        uint256 balance;
        for (uint256 i = 0; i < accounts.length; i++) {
            balance = token.balanceOf(accounts[i]);
            result[i] = balance;
            total += balance;
        }
        return (result, total);
    }
}