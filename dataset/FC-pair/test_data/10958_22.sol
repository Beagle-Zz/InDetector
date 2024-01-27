contract c10958{
    // @return true if the goal is reached
    function capReached() public constant returns (bool) {
        return weiRaised >= cap;
    }
}