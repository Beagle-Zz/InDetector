contract c16407{
    /**
    * @dev The fusion chamber combines both dnas and adds a generation.
    */
    function fusionChibis(uint _fatherId, uint _motherId, uint _seed, string _name, string _battleRoar, uint8 _region) payable public returns (bool success) {
        require(fusionPaused == false);
        require(ownerOf(_fatherId) == msg.sender);
        require(ownerOf(_motherId) != msg.sender);
        require(chibies[_fatherId].adult <= now);
        require(chibies[_fatherId].exhausted <= now);
        require(chibies[_motherId].adult <= now);
        require(chibies[_motherId].exhausted <= now);
        require(chibies[_motherId].forFusion == true);
        require(chibies[_motherId].fusionPrice == msg.value);
        // exhaust father and mother
        chibies[_motherId].forFusion = false;
        chibies[_motherId].exhausted = now.add(exhaustFusion(_motherId));
        chibies[_fatherId].exhausted = now.add(exhaustFusion(_fatherId));
        uint _gen = 0;
        if (chibies[_fatherId].gen >= chibies[_motherId].gen) {
            _gen = chibies[_fatherId].gen.add(1);
        } else {
            _gen = chibies[_motherId].gen.add(1);
        }
        // fusion chamber here we come
        uint16[13] memory dna = traits(geneContract.splitGenes(address(this), _seed, uniqueCounter+1), _seed, _fatherId, _motherId);
        // new Chibi is born!
        addToken(msg.sender, uniqueCounter);
        // father and mother get the chibi in their fusion list
        chibies[_fatherId].fusions.push(uniqueCounter);
        // only add if mother different than father, otherwise double entry
        if (_fatherId != _motherId) {
            chibies[_motherId].fusions.push(uniqueCounter);
        }
        // baby Chibi won't have fusions
        uint[] memory _fusions;
        // baby Chibis can't be fused
        chibies.push(Chibi(
            msg.sender,
            false,
            _name, 
            dna,
            _fatherId,
            _motherId,
            _gen,
            _fusions,
            false,
            priceFusionChibi,
            0,
            now.add(adultTime.mul((_gen.mul(_gen)).add(1))),
            strConcat(_infoUrlPrefix, uint2str(uniqueCounter))
        ));
        // fires chibi created event
        emit ChibiCreated(
            uniqueCounter,
            chibies[uniqueCounter].owner,
            chibies[uniqueCounter].founder,
            chibies[uniqueCounter].nameChibi,
            chibies[uniqueCounter].dna, 
            chibies[uniqueCounter].father, 
            chibies[uniqueCounter].mother, 
            chibies[uniqueCounter].gen,
            chibies[uniqueCounter].adult,
            chibies[uniqueCounter].infoUrl
        );
        // send transfer event
        emit Transfer(0x0, msg.sender, uniqueCounter);
        // create Warrior
        if (battleContract.addWarrior(address(this), uniqueCounter, _region, _battleRoar) == false) revert();
        uniqueCounter ++;
        // transfer money to seller minus our share, remain stays in contract
        uint256 amount = msg.value / 100 * comission;
        chibies[_motherId].owner.transfer(amount);
        return true;
 }
}