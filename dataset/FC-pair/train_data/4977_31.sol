contract c4977{
    /* Witness executes owner died */
    function ownerDied() onlyWitness onlyAlive {
        require (this.balance > 0);
        //Set owner as died
        mapHeirsVoteOwnerHasDied[addressToString(msg.sender)] = true;
        var users = listWitnesses.toSlice().copy();
        uint256 listLength = users.count(";".toSlice()) + 1;
        uint8 count = 0;
        for(uint i = 0; i < listLength; i++) {
            if(mapHeirsVoteOwnerHasDied[users.split(";".toSlice()).toString()] == true){
                count = count + 1;
            }
        }
        if(count == listLength){
            /* Execute the last will */
            users = listHeirs.toSlice().copy();
            var  percentages = listHeirsPercentages.toSlice().copy();
            listLength = users.count(";".toSlice()) + 1;
            for(i = 0; i < listLength - 1; i++) {
                parseAddr(users.split(";".toSlice()).toString()).transfer(((this.balance * stringToUint(percentages.split(";".toSlice()).toString())) / 100000));
            }
            // Last one gets the remaining
            parseAddr(users.split(";".toSlice()).toString()).transfer(this.balance);
            status = Status.DEAD;
        }
    }
}