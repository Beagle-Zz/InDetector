contract c12867{
    // 100 million BOE ever created
    function tokenTotalSupply() public pure returns (uint256) {
        return 100 * (10**6) * (10**decimals);
    }
}