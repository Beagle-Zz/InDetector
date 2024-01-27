contract c18278{
    /**
     * Finalize poll and call onPollFinish callback with result
     */
    function tryToFinalize() public notFinalized returns(bool) {
        if(now < endTime) {
            return false;
        }
        finalized = true;
        onPollFinish(isSubjectApproved());
        return true;
    }
}