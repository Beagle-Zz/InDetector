contract c2480{
    /**
     * @notice Get the Instructions that helped to used the module
     */
    function getInstructions() public view returns(string) {
        return "Create a ERC20 dividend which will be paid out to token holders proportional to their balances at the point the dividend is created";
    }
}