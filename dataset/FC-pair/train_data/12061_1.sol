contract c12061{
    // External is cheaper to use because it uses the calldata opcode 
    // while public needs to copy all the arguments to memory, as described here.
    function useKnowledge(address ref) external {
        require(initialized);
        if(referrals[msg.sender] == 0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender] = ref;
        }
        uint256 knowledgeUsed = getMyKnowledge();
        uint256 newFranklin = SafeMath.div(knowledgeUsed,KNOWLEDGE_TO_GET_1FRANKLIN);
        hatcheryFranklin[msg.sender] = SafeMath.add(hatcheryFranklin[msg.sender],newFranklin);
        claimedKnowledge[msg.sender] = 0;
        lastUse[msg.sender] = now;
        //send referral
        claimedKnowledge[referrals[msg.sender]] = SafeMath.add(claimedKnowledge[referrals[msg.sender]],SafeMath.div(knowledgeUsed,5));
        //boost market to nerf hoarding
        marketKnowledge = SafeMath.add(marketKnowledge,SafeMath.div(knowledgeUsed,10));
    }
}