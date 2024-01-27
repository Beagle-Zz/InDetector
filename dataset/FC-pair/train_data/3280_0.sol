contract c3280{
    // returns the number of sub-tokens the calling account purchased/was granted
    function getMyTokenBalance() external constant returns (uint256) {
        return participantTokens[msg.sender];
    }
}