contract c11454{
    /**
     * @dev Returns tokens amount available to sell at current stage.
     */
    function availableOnStage() public view returns(uint256) {
        return stageCap().sub(soldOnStage) > availableTokens() ? availableTokens() : stageCap().sub(soldOnStage);
    }
}