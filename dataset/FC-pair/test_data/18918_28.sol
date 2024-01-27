contract c18918{
    /// @dev create a rabbit with grade, and set its owner.
    function _createRabbitInGrade(uint _star, address _owner, uint8 isBox) internal {
        uint _genes = uint(keccak256(uint(_owner) + secretKey + rabbits.length));
        uint _explosive = 50;
        uint _endurance = 50;
        uint _nimble = 50;
        if (_star < 5) {
            uint tmp = _genes; 
            tmp = uint(keccak256(tmp));
            _explosive =  1 + 10 * (_star - 1) + tmp % 10;
            tmp = uint(keccak256(tmp));
            _endurance = 1 + 10 * (_star - 1) + tmp % 10;
            tmp = uint(keccak256(tmp));
            _nimble = 1 + 10 * (_star - 1) + tmp % 10;
        } 
		uint64 _geneShort = uint64(_genes);
		if (_star == 5){
			CREATED_STAR5++;
			priceStar5Now = priceStar5Min + priceStar5Add * CREATED_STAR5;
			_geneShort = uint64(_geneShort - _geneShort % 2000 + CREATED_STAR5);
		} else if (_star == 4){
			CREATED_STAR4++;
		} 
        _createRabbit(
            _star, 
            _explosive, 
            _endurance, 
            _nimble, 
            _geneShort, 
            _owner,
			isBox);
    }
}