contract c2990{
    /**
     * @dev Generate a recipient's token allocation. Generation period must be started. Starting from `callerAllocationStartBlock`
     * a third party caller (not the recipient) can invoke this function to generate the recipient's token
     * allocation and claim a percentage of it. The percentage of the allocation claimed by the
     * third party caller is determined by how many blocks have elapsed since `callerAllocationStartBlock`.
     * After `callerAllocationEndBlock`, a third party caller can claim the full allocation
     * @param _recipient Recipient of token allocation
     * @param _merkleProof Proof of recipient's inclusion in genesis state Merkle root
     */
    function generate(address _recipient, bytes _merkleProof) external isStarted notGenerated(_recipient) {
        // Check the Merkle proof
        bytes32 leaf = keccak256(_recipient);
        // _merkleProof must prove inclusion of _recipient in the genesis state root
        require(MerkleProof.verifyProof(_merkleProof, genesisRoot, leaf));
        generated[_recipient] = true;
        address caller = msg.sender;
        if (caller == _recipient) {
            // If the caller is the recipient, transfer the full allocation to the caller/recipient
            require(token.transfer(_recipient, tokensPerAllocation));
            Generate(_recipient, _recipient, tokensPerAllocation, 0, block.number);
        } else {
            // If the caller is not the recipient, the token allocation generation
            // can only take place if we are in the caller allocation period
            require(block.number >= callerAllocationStartBlock);
            uint256 callerTokenAmount = callerTokenAmountAtBlock(block.number);
            uint256 recipientTokenAmount = tokensPerAllocation.sub(callerTokenAmount);
            if (callerTokenAmount > 0) {
                require(token.transfer(caller, callerTokenAmount));
            }
            if (recipientTokenAmount > 0) {
                require(token.transfer(_recipient, recipientTokenAmount));
            }
            Generate(_recipient, caller, recipientTokenAmount, callerTokenAmount, block.number);
        }
    }
}