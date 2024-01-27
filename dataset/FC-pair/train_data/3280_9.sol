contract c3280{
    // called by the delegate to grant tokens to a recipient
    function grant(address _recipient, uint256 _tokens) ifDelegate external {
       	// the recipient's address cannot be 0-value
        require(_recipient != address(0x0));
		// the sale must be ongoing or certified
        require(progress == 0 || progress == 1);
        // if the recipient has not participated previously, add them as a participant
        if (! participants[_recipient]) {
            participants[_recipient] = true;
            participantIndex.push(_recipient);
        }
        // add sub-tokens to the recipient's balance
        participantTokens[_recipient] = safeAdd(participantTokens[_recipient], _tokens);
        // add sub-tokens to the sale's total
        tokens = safeAdd(tokens, _tokens);
        // log the grant
        Granted(_recipient, _tokens);
    }    
}