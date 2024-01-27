contract c16505{
    // Get bonus percent
    function getBonusPercent() internal view returns(uint256) {
        uint256 collectedWei = weiRaised.add(preSale.weiRaised());
        if (collectedWei < 1500 * 0.000001 ether) {
            return 20;
        }
        if (collectedWei < 5000 * 0.000001 ether) {
            return 10;
        }
        if (collectedWei < 10000 * 0.000001 ether) {
            return 5;
        }
        return 0;
    }
}