contract c9851{
    // -----------------------
    // TOKEN HOLDER INTERFACE
    // -----------------------
    /**
    @notice propose a reparamaterization of the key _name's value to _value.
    @param _name the name of the proposed param to be set
    @param _value the proposed value to set the param to be set
    */
    function proposeReparameterization(string _name, uint _value) public returns (bytes32) {
        uint deposit = get("pMinDeposit");
        bytes32 propID = keccak256(_name, _value);
        if (keccak256(_name) == keccak256("dispensationPct") ||
            keccak256(_name) == keccak256("pDispensationPct")) {
            require(_value <= 100);
        }
        require(!propExists(propID)); // Forbid duplicate proposals
        require(get(_name) != _value); // Forbid NOOP reparameterizations
        // attach name and value to pollID
        proposals[propID] = ParamProposal({
            appExpiry: now.add(get("pApplyStageLen")),
            challengeID: 0,
            deposit: deposit,
            name: _name,
            owner: msg.sender,
            processBy: now.add(get("pApplyStageLen"))
                .add(get("pCommitStageLen"))
                .add(get("pRevealStageLen"))
                .add(PROCESSBY),
            value: _value
        });
        require(token.transferFrom(msg.sender, this, deposit)); // escrow tokens (deposit amt)
        emit _ReparameterizationProposal(_name, _value, propID, deposit, proposals[propID].appExpiry, msg.sender);
        return propID;
    }
}