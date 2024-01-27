contract c216{
    /// @dev requires the voter to not have voted already
    modifier notVoted() {
        uint256 length = currentProposal.yay.length;
        for(uint i = 0; i < length; i++) {
            if(currentProposal.yay[i] == msg.sender) {
                revert("Already voted");
            }
        }
        length = currentProposal.nay.length;
        for(i = 0; i < length; i++) {
            if(currentProposal.nay[i] == msg.sender) {
                revert("Already voted");
            }
        }
        _;
    }
}