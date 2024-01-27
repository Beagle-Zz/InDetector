contract c12392{
    /********************************* */
    // sign function
    function sign (uint _petitionId) public {
        // cant send it to a non existing petition
        require (keccak256(petitions[_petitionId].name) != keccak256(""));
        require (ownerPetitionSignerArrayCreated[msg.sender][_petitionId] == 0);
        //if (ownerPetitionSignerArrayCreated[msg.sender][_petitionId] == 0) {
        uint id = petitionsigners.push(PetitionSigner(_petitionId, msg.sender, now)) - 1;
        emit NewPetitionSigner(id, _petitionId, msg.sender, now);
        petitionSignerMap[msg.sender][_petitionId] = id;
        ownerPetitionSignerArrayCreated[msg.sender][_petitionId] = 1;
        petitions[_petitionId].totalSignatures = petitions[_petitionId].totalSignatures + 1;
        //}
        // new div pool?
        endDividendPool();
    }
}