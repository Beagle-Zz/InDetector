contract c14670{
    /**
     * @dev check user's REB balance tier
     * @param holderAddress Token holder address
     * @return string representing the milestone tier
     */
    function checkBalanceTier(address holderAddress) public view returns(string) {
        uint256 holderBalance = balanceOf(holderAddress);
        if (holderBalance >= 1000000e18) {
            return "Platinum tier";
        } else if (holderBalance >= 700000e18) {
            return "Gold tier";
        } else if (holderBalance >= 300000e18) {
            return "Titanium tier";
        } else if (holderBalance == 0) {
            return "Possess no REB";
        }
        return "Free tier";
    }
}