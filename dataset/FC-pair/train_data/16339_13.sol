contract c16339{
    // method to just check the reward amount
    function checkReward() afterRace external constant returns (uint) {
        require(!voterIndex[msg.sender].rewarded);
        return calculateReward(msg.sender);
    }
}