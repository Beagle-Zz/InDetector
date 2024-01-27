contract c13437{
    // Get bonus percent
    function getBonusPercent() internal view returns(uint256) {
        uint256 collectedWei = weiRaised.add(preSale.weiRaised());
        if (collectedWei < 1500 * 1 ether) {
            return 20;
        }
        if (collectedWei < 5000 * 1 ether) {
            return 10;
        }
        if (collectedWei < 10000 * 1 ether) {
            return 5;
        }
        return 0;
    }
}