contract c18810{
    /* If the motion was to terminate at this instant, it would pass.
     * That is: there was sufficient participation and a sizeable enough majority. */
    function motionPasses(uint motionID)
        public
        view
        returns (bool)
    {
        uint yeas = votesFor[motionID];
        uint nays = votesAgainst[motionID];
        uint totalVotes = safeAdd(yeas, nays);
        if (totalVotes == 0) {
            return false;
        }
        uint participation = safeDiv_dec(totalVotes, havven.totalSupply());
        uint fractionInFavour = safeDiv_dec(yeas, totalVotes);
        // We require the result to be strictly greater than the requirement
        // to enforce a majority being "50% + 1", and so on.
        return participation > requiredParticipation &&
               fractionInFavour > requiredMajority;
    }
}