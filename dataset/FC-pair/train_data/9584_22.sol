contract c9584{
    /* Init ballot */
    function initBallot( bytes32 specHash
                       , uint256 packed
                       , IxIface ix
                       , address bbAdmin
                       , bytes24 extraData
                ) only_editors() external returns (uint ballotId) {
        // calculate the ballotId based on the last 224 bits of the specHash.
        ballotId = uint224(specHash) ^ (uint256(NAMESPACE) << 224);
        // we need to call the init functions on our libraries
        getDb(ballotId).init(specHash, packed, ix, bbAdmin, bytes16(uint128(extraData)));
        nBallots += 1;
        emit BallotCreatedWithID(ballotId);
    }
}