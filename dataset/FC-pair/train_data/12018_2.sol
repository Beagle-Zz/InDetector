contract c12018{
    /* Functions */
    // "Constructor" function - init core params on deploy
    // timestampts are uint64s to give us plenty of room for millennia
    function init(DB storage db, bytes32 _specHash, uint256 _packed, IxIface ix, address ballotOwner, bytes16 extraData) external {
        db.index = ix;
        db.ballotOwner = ballotOwner;
        uint64 startTs;
        uint64 endTs;
        uint16 sb;
        (sb, startTs, endTs) = BPackedUtils.unpackAll(_packed);
        bool _testing = isTesting(sb);
        if (_testing) {
            emit TestingEnabled();
        } else {
            require(endTs > now, "bad-end-time");
            // 0x1ff2 is 0001111111110010 in binary
            // by ANDing with subBits we make sure that only bits in positions 0,2,3,13,14,15
            // can be used. these correspond to the option flags at the top, and ETH ballots
            // that are enc'd or plaintext.
            require(sb & 0x1ff2 == 0, "bad-sb");
            // if we give bad submission bits (e.g. all 0s) then refuse to deploy ballot
            bool okaySubmissionBits = 1 == (isEthNoEnc(sb) ? 1 : 0) + (isEthWithEnc(sb) ? 1 : 0);
            require(okaySubmissionBits, "!valid-sb");
            // take the max of the start time provided and the blocks timestamp to avoid a DoS against recent token holders
            // (which someone might be able to do if they could set the timestamp in the past)
            startTs = startTs > now ? startTs : uint64(now);
        }
        require(db.specHash == bytes32(0), "b-exists");
        require(_specHash != bytes32(0), "null-specHash");
        db.specHash = _specHash;
        db.packed = BPackedUtils.pack(sb, startTs, endTs);
        db.creationTs = now;
        if (extraData != bytes16(0)) {
            db.extraData = extraData;
        }
        emit CreatedBallot(db.specHash, startTs, endTs, sb);
    }
}