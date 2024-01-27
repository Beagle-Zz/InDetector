contract c16216{
    // used to withdraw funds from the contract from an ended fundraiser or refunds when the
    // fundraiser is cancelled
    function withdraw() public {
        // check for a balance
        uint256 _balance = balance();
        require (_balance > 0); // can only withdraw a balance
        address _wallet;
        // check for fundraiser ended normally
        if (_state._participant != address(0)) {
            // determine split based on sender
            if (msg.sender == deployment._cause) {
                _state._causeWithdrawn = true;
                _wallet = deployment._causeWallet;
            } else if (msg.sender == _state._participant) {
                _state._participantWithdrawn = true;
                _wallet = _state._participant;
            } else if (msg.sender == deployment._owner) {
                _state._ownerWithdrawn = true;
                _wallet = deployment._ownerWallet;
            } else {
                revert();
            }
        } else if (_state._cancelled) {
            // set participant entries to zero to prevent multiple refunds
            Participant storage _participant = participants[msg.sender];
            _participant._entries = 0;
            _wallet = msg.sender;
        } else {
            // no selected and not cancelled
            revert();
        }
        // execute the refund if we have one
        _wallet.transfer(_balance);
        // send withdrawal event
        Withdrawal(msg.sender);
    }
}