contract c16820{
    // return true if the crowdsale has raised enough money to be a successful.
    function isMinimumGoalReached() public constant returns (bool) {
        return weiRaised >= weiMinimumGoal;
    }
}