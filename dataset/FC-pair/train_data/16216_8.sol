contract c16216{
    // ends this fundraiser, selects a participant to reward, and allocates funds for the cause, the
    // selected participant, and the contract owner
    function end(bytes32 _message) public recapPhase onlyOwner {
        require(!_state._cancelled); // fundraiser not cancelled
        require(_state._causeMessage != 0x0); // cause must have revealed
        require(_state._revealBlockNumber != 0); // reveal block number must be set
        require(_state._ownerMessage == 0x0); // cannot have ended already
        require(_decode(deployment._ownerSecret, _message)); // check for valid message
        require(block.number > _state._revealBlockNumber); // verify reveal has been mined
        // get the (cause) reveal blockhash and ensure within 256 blocks (non-zero)
        _state._revealBlockHash = uint256(block.blockhash(_state._revealBlockNumber));
        require(_state._revealBlockHash != 0);
        // save revealed owner message
        _state._ownerMessage = _message;
        bytes32 _randomNumber;
        address _participant;
        bytes32 _participantMessage;
        // add additional entropy to the random from participant messages
        for (uint256 i = 0; i < deployment._entropy; i++) {
            // calculate the next random
            _randomNumber = keccak256(
                _message,
                _state._causeMessage,
                _state._revealBlockHash,
                _participantMessage
            );
            // calculate next entry and grab corresponding participant
            uint256 _entry = uint256(_randomNumber) % _state._entries;
            _participant = _findParticipant(_entry);
            _participantMessage = participants[_participant]._message;
        }
        // the final participant receives the reward
        _state._participant = _participant;
        // send out select event
        Selection(
            _state._participant,
            _participantMessage,
            _state._causeMessage,
            _message
        );
    }
}