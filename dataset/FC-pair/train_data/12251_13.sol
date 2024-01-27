contract c12251{
	/// @dev An internal method that creates a new Zodiac and stores it. This
	///  method doesn't do any checking and should only be called when the
	///  input data is known to be valid. Will generate both a Birth event
	///  and a Transfer event.
	/// @param _matronId The Zodiac ID of the matron of this zodiac (zero for gen0)
	/// @param _sireId The Zodiac ID of the sire of this zodiac (zero for gen0)
	/// @param _generation The generation number of this zodiac, must be computed by caller.
	/// @param _genes The Zodiac's genetic code.
	/// @param _owner The inital owner of this zodiac, must be non-zero (except for the unZodiac, ID 0)
	/// @param _zodiacType The type of this zodiac
	function _createZodiac(
		uint256 _matronId,
		uint256 _sireId,
		uint256 _generation,
		uint256 _genes,
		address _owner,
		uint256 _zodiacType
	)
		internal
		returns (uint)
	{
		// These requires are not strictly necessary, our calling code should make
		// sure that these conditions are never broken. However! _createZodiac() is already
		// an expensive call (for storage), and it doesn't hurt to be especially careful
		// to ensure our data structures are always valid.
		require(_matronId == uint256(uint32(_matronId)));
		require(_sireId == uint256(uint32(_sireId)));
		require(_generation == uint256(uint16(_generation)));
        require(_zodiacType == uint256(uint16(_zodiacType)));
		// New Zodiac starts with the same cooldown as parent gen/2
		uint16 cooldownIndex = uint16(_generation / 2);
		if (cooldownIndex > 13) {
			cooldownIndex = 13;
		}
		Zodiac memory _Zodiac = Zodiac({
			genes: _genes,
			birthTime: uint64(now),
			cooldownEndBlock: 0,
			matronId: uint32(_matronId),
			sireId: uint32(_sireId),
			siringWithId: 0,
			cooldownIndex: cooldownIndex,
			generation: uint16(_generation),
			zodiacType: uint16(_zodiacType)
		});
		uint256 newZodiacId = zodiacs.push(_Zodiac) - 1;
		// It's probably never going to happen, 4 billion zodiacs is A LOT, but
		// let's just be 100% sure we never let this happen.
		require(newZodiacId == uint256(uint32(newZodiacId)));
		// emit the birth event
		Birth(
			_owner,
			newZodiacId,
			uint256(_Zodiac.matronId),
			uint256(_Zodiac.sireId),
			_Zodiac.genes,
			uint256(_Zodiac.generation),
			uint256(_Zodiac.zodiacType)
		);
		// This will assign ownership, and also emit the Transfer event as
		// per ERC721 draft
		_transfer(0, _owner, newZodiacId);
		return newZodiacId;
	}
}