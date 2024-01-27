contract c16216{
    // returns the balance of a cause, selected participant, owner, or participant (refund)
    function balance() public view returns (uint256) {
        // check for fundraiser ended normally
        if (_state._participant != address(0)) {
            // selected, get split
            uint256 _split;
            // determine split based on sender
            if (msg.sender == deployment._cause) {
                if (_state._causeWithdrawn) {
                    return 0;
                }
                _split = deployment._causeSplit;
            } else if (msg.sender == _state._participant) {
                if (_state._participantWithdrawn) {
                    return 0;
                }
                _split = deployment._participantSplit;
            } else if (msg.sender == deployment._owner) {
                if (_state._ownerWithdrawn) {
                    return 0;
                }
                _split = deployment._ownerSplit;
            } else {
                return 0;
            }
            // multiply total entries by split % (non-revealed winnings are forfeited)
            return _state._entries * deployment._valuePerEntry * _split / 1000;
        } else if (_state._cancelled) {
            // value per entry times participant entries == balance
            Participant storage _participant = participants[msg.sender];
            return _participant._entries * deployment._valuePerEntry;
        }
        return 0;
    }
}