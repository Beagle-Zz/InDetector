contract c16492{
    /**
    * @dev Mint token function
    * @param _name name of the Chibi
    */
    function _mint(string _name, string _battleRoar, uint8 _region, uint _seed, bool _founder, uint _specialId) internal {
        require(msg.sender != address(0));
        addToken(msg.sender, uniqueCounter);
        // creates a gen0 Chibi, no father, mother, gen0
        uint16[13] memory dna;
        if (_specialId > 0) {
            dna  = geneContract.createGenes(address(this), _seed, _founder, uniqueCounter, _specialId);
        } else {
            dna = geneContract.createGenes(address(this), _seed, _founder, uniqueCounter, 0);
        }
        uint[] memory _fusions;
        chibies.push(Chibi(
            msg.sender,
            _founder,
            _name, 
            dna,
            0,
            0,
            0,
            _fusions,
            false,
            priceFusionChibi,
            0,
            now.add(adultTime),
            strConcat(_infoUrlPrefix, uint2str(uniqueCounter))
        ));
        // send transfer event
        emit Transfer(0x0, msg.sender, uniqueCounter);
        // create Warrior
        if (battleContract.addWarrior(address(this), uniqueCounter, _region, _battleRoar) == false) revert();
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
        uniqueCounter ++;
    }
}