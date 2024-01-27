contract c137{
    // @dev requries that if this proposer was the last proposer, that he or she has reached the 
    // cooldown limit
    modifier cooledDown( ){
        if(msg.sender == currentProposal.proposer && (block.timestamp - cooldownStart < 1 days)){
            revert("Cool down period not passed yet");
        }
        _;
    }
}