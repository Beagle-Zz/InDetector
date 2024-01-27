contract c12392{
    /********************************* */
    // start admin functions
    function initialOwnersShares() public onlyOwner(){
        require(initialOwnerSharesClaimed == 0);
        uint numberOfShares = 1000000;
        uint id = PetitionShareholders.push(PetitionShareholder(msg.sender, numberOfShares, 0, now)) - 1;
        emit NewPetitionShareholder(id, msg.sender, numberOfShares, 0, now);
        PetitionShareholderMap[msg.sender] = id;
        ownerPetitionShareholderArrayCreated[msg.sender] = 1;
        sharesSold = sharesSold + numberOfShares;
        ownerShareAddress = msg.sender;
        // dividend pool
        dividendPoolStarts = now;
        dividendPoolEnds = (now + dividendCooldown);
        initialOwnerSharesClaimed = 1; // owner can only claim the intial 1,000,000 shares once
    }
}