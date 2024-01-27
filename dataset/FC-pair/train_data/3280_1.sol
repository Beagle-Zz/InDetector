contract c3280{
    // allows an individual to buy tokens (which will not be issued immediately)
    // individual instructs the tokens to be delivered to a specific account, which may be different than msg.sender
    function buy(address _recipient) public payable {
        // _recipient address must not be all 0's
        require(_recipient != address(0x0));
		// contributor must send more than 1/10 ETH
        require(msg.value >= 10 ** 17);
		// sale must be considered active
        require(active);
		// sale must be ongoing or certified
        require(progress == 0 || progress == 1);
		// current timestamp must be greater than or equal to the start of the token sale
        require(block.timestamp >= start);
		// current timestamp must be less than the end of the token sale
        require(block.timestamp < finish);
		// either the token sale isn't restricted, or the sender is on the whitelist
        require((! restricted) || whitelist[msg.sender]);
        // either the token sale isn't restricted, or the recipient is on the whitelist
        require((! restricted) || whitelist[_recipient]);
        // multiply sub-ether by the pricer (which will be a whole number >= 1) to get sub-tokens
        uint256 baseTokens = safeMul(msg.value, pricer);
        // determine how many bonus sub-tokens to award and add that to the base tokens
        uint256 totalTokens = safeAdd(baseTokens, safeDiv(safeMul(baseTokens, getBonusPercentage()), 100));
		// ensure the purchase does not cause the sale to exceed its maximum size
        require(safeAdd(tokens, totalTokens) <= size);
        // if the recipient is new, add them as a participant
        if (! participants[_recipient]) {
            participants[_recipient] = true;
            participantIndex.push(_recipient);
        }
        // increment the participant's sub-tokens and sub-ether
        participantTokens[_recipient] = safeAdd(participantTokens[_recipient], totalTokens);
        participantValues[_recipient] = safeAdd(participantValues[_recipient], msg.value);
		// increment sale sub-tokens and sub-ether
        tokens = safeAdd(tokens, totalTokens);
        value = safeAdd(value, msg.value);
        // log purchase event
        Bought(msg.sender, _recipient, totalTokens, msg.value);
    }
}