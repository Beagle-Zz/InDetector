contract c12392{
    // transfer shares
    function transferShares(uint _amount, address _to) public {
        require(ownerPetitionShareholderArrayCreated[msg.sender] > 0);
        require((PetitionShareholders[PetitionShareholderMap[msg.sender]].shares - PetitionShareholders[PetitionShareholderMap[msg.sender]].sharesListedForSale) >= _amount);
        // give to receiver
        if (ownerPetitionShareholderArrayCreated[_to] == 0) {
            // new investor
            uint id = PetitionShareholders.push(PetitionShareholder(_to, _amount, 0, now)) - 1;
            emit NewPetitionShareholder(id, _to, _amount, 0, now);
            PetitionShareholderMap[_to] = id;
            ownerPetitionShareholderArrayCreated[_to] = 1;
        } else {
            // add to amount
            PetitionShareholders[PetitionShareholderMap[_to]].shares = PetitionShareholders[PetitionShareholderMap[_to]].shares + _amount;
        }
        // take from sender
        PetitionShareholders[PetitionShareholderMap[msg.sender]].shares = PetitionShareholders[PetitionShareholderMap[msg.sender]].shares - _amount;
        PetitionShareholders[PetitionShareholderMap[msg.sender]].sharesListedForSale = PetitionShareholders[PetitionShareholderMap[msg.sender]].sharesListedForSale - _amount;
        // new div pool?
        endDividendPool();
    }
}