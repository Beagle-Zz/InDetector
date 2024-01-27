contract c18592{
     /// @dev calcute the tokens
    function percent(uint256 percentage) internal view returns (uint256) {
        return percentage.mul(topTotalSupply).div(100);
    }
}