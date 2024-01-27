contract c13413{
    /**
    @dev Gets the numTokens property of getLastNode
    @param _voter Address of user to check against
    @return Maximum number of tokens committed in poll specified
    */
    function getLockedTokens(address _voter) constant public returns (uint numTokens) {
        return getNumTokens(_voter, getLastNode(_voter));
    }
}