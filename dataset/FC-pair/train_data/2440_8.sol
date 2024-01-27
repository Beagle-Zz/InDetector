contract c2440{
    /// @notice Sets the message sender as the winner if they have completed the hunt
    /// @dev Location order should be enforced offline, checks here are to ward against cheaters
    /// @param decryptKeys Array of user passwords corresponding to original submissions 
    function checkWin(uint[] decryptKeys) public {
        require(!grace);
        require(decryptKeys.length == locations.length);
        uint lastBlock = 0;
        bool won = true;
        for (uint i; i < locations.length; i++) {
            // Make sure locations were visited in order
            require(hunters[msg.sender][i].block > lastBlock);
            lastBlock = hunters[msg.sender][i].block;
            // Skip removed locations
            if (locations[i] != 0) {
                uint storedVal = uint(keccak256(abi.encodePacked(hunters[msg.sender][i].encryptKey ^ decryptKeys[i])));
                won = won && (locations[i] == storedVal);
            }
        }
        require(won);
        if (won) {
            timeOfWin = now;
            winner = msg.sender;
            grace = true;
            emit WonEvent(winner);
        }
    }
}