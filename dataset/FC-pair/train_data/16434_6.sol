contract c16434{
    // Non-Standard token transfer, doesn't confine to any ERC
    function sendOwnership(address receiver, uint256 amount) public onlyWhitelisted() {
        // Require they have an actual balance
        require(ownerShareTokens[msg.sender] > 0);
        // Require the amount to be equal or less to their shares
        require(ownerShareTokens[msg.sender] >= amount);
        // Deduct the amount from the owner
        ownerShareTokens[msg.sender] = SafeMath.sub(ownerShareTokens[msg.sender], amount);
        // Remove the owner if the share is now 0
        if (ownerShareTokens[msg.sender] == 0) {
            ownerPercentages[msg.sender] = 0;
            whitelist[receiver] = false; 
        } else { // Recalculate percentage
            ownerPercentages[msg.sender] = percent(ownerShareTokens[msg.sender], valuation, 5);
        }
        // Add the new share holder
        if (ownerShareTokens[receiver] == 0) {
            whitelist[receiver] = true;
            ownerAddresses[totalOwners] = receiver;
            totalOwners += 1;
        }
        ownerShareTokens[receiver] = SafeMath.add(ownerShareTokens[receiver], amount);
        ownerPercentages[receiver] = SafeMath.add(ownerPercentages[receiver], percent(amount, valuation, 5));
        emit OwnershipTransferred(msg.sender, receiver, amount);
    }
}