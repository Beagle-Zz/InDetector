contract c16875{
    /**
     * Withdraw the earned Torch Dividends to Ether
     *  - Does not touch Token Dividends or Token Referral Bonuses
     */
    function withdrawFor_(address _for) internal returns (uint256) {
        uint256 torchDividends = playerData_[_for].dividends;
        if (playerData_[_for].dividends > 0) {
            playerData_[_for].dividends = 0;
            playerData_[_for].profits = playerData_[_for].profits.add(torchDividends);
            _for.transfer(torchDividends);
        }
        return torchDividends;
    }
}