contract c13413{
    /**
    @dev Gets top element of sorted poll-linked-list
    @param _voter Address of user to check against
    @return Integer identifier to poll with maximum number of tokens committed to it
    */
    function getLastNode(address _voter) constant public returns (uint pollID) {
        return dllMap[_voter].getPrev(0);
    }
}