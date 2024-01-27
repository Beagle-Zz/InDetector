contract c13952{
    /************************************************************/
    /******************** PUBLIC VIEWS **************************/
    /************************************************************/
    // IMPLEMENTS: Bankrollable.getProfits()
    // Ensures contract always has at least bankroll + totalCredits.
    function getCollateral() public view returns (uint _amount) {
        return vars.totalCredits;
    }
}