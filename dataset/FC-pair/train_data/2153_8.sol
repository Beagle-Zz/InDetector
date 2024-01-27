contract c2153{
    /**
     * @dev Function is used to perform a multi-transfer operation. This could play a significant role in the Ammbr Mesh Routing protocol.
     *  
     * Mechanics:
     * Sends tokens from Sender to destinations[0..n] the amount tokens[0..n]. Both arrays
     * must have the same size, and must have a greater-than-zero length. Max array size is 127.
     * 
     * IMPORTANT: ANTIPATTERN
     * This function performs a loop over arrays. Unless executed in a controlled environment,
     * it has the potential of failing due to gas running out. This is not dangerous, yet care
     * must be taken to prevent quality being affected.
     * 
     * @param destinations An array of destinations we would be sending tokens to
     * @param tokens An array of tokens, sent to destinations (index is used for destination->token match)
     */
    function multiTransfer(address[] destinations, uint256[] tokens) public returns (bool success){
        // Two variables must match in length, and must contain elements
        // Plus, a maximum of 127 transfers are supported
        require(destinations.length > 0);
        require(destinations.length < 128);
        require(destinations.length == tokens.length);
        // Check total requested balance
        uint8 i = 0;
        uint256 totalTokensToTransfer = 0;
        for (i = 0; i < destinations.length; i++){
            require(tokens[i] > 0);            
            // Prevent Integer-Overflow by using Safe-Math
            totalTokensToTransfer = totalTokensToTransfer.add(tokens[i]);
        }
        // Do we have enough tokens in hand?
        // Note: Although we are testing this here, the .sub() function of 
        //       SafeMath would fail if the operation produces a negative result
        require (balances[msg.sender] > totalTokensToTransfer);        
        // We have enough tokens, execute the transfer
        balances[msg.sender] = balances[msg.sender].sub(totalTokensToTransfer);
        for (i = 0; i < destinations.length; i++){
            // Add the token to the intended destination
            balances[destinations[i]] = balances[destinations[i]].add(tokens[i]);
            // Call the event...
            emit Transfer(msg.sender, destinations[i], tokens[i]);
        }
        return true;
    }
}