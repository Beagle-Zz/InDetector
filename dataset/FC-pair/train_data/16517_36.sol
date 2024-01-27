contract c16517{
    /**
     * Given an amount in UI, this method returns the equivalent amount
     * in mini-UI.
     *
     * @param amount    an amount expressed in units of UI
     */
    function convertToMiniUI(uint amount) internal constant returns (uint) {
        return amount * (10 ** uint(tokenReward.decimals()));
    }
}