contract c18729{
    // get the amount of unsold tokens allocated to this contract;
    function getWeiLeft() external constant returns (uint) {
        return weiMaximumGoal - weiRaised;
    }
}