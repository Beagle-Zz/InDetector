contract c13840{
    /**
     * @dev set the bonus multiplier.
     */
    function setBonusMultiplier(uint256 bonusMultiplier_) public onlyOwner {
        bonusMultiplier = bonusMultiplier_;
    }
}