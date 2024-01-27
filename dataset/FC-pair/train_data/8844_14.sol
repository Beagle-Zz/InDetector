contract c8844{
	/// @dev An internal method that creates a new LinglongCat and stores it. This
	///  method doesn't do any checking and should only be called when the
	///  input data is known to be valid. Will generate both a Birth event
	///  and a Transfer event.
	/// @param _matronId The LinglongCat ID of the matron of this LinglongCat (zero for gen0)
	/// @param _sireId The LinglongCat ID of the sire of this LinglongCat (zero for gen0)
	/// @param _generation The generation number of this LinglongCat, must be computed by caller.
	/// @param _genes The LinglongCat's genetic code.
	/// @param _owner The inital owner of this LinglongCat, must be non-zero (except for the unLinglongCat, ID 0)
    /// @param _time The birth time of LinglongCat
    /// @param _cooldownIndex The cooldownIndex of LinglongCat
	function _createLinglongCatWithTime(
		uint256 _matronId,
		uint256 _sireId,
		uint256 _generation,
		uint256 _genes,
		address _owner,
        uint256 _time,
        uint256 _cooldownIndex
	)
	internal
	returns (uint)
	{
		// These requires are not strictly necessary, our calling code should make
		// sure that these conditions are never broken. However! _createLinglongCat() is already
		// an expensive call (for storage), and it doesn't hurt to be especially careful
		// to ensure our data structures are always valid.
		require(_matronId == uint256(uint32(_matronId)));
		require(_sireId == uint256(uint32(_sireId)));
		require(_generation == uint256(uint16(_generation)));
        require(_time == uint256(uint64(_time)));
        require(_cooldownIndex == uint256(uint16(_cooldownIndex)));
        // Copy down LinglongCat cooldownIndex
        uint16 cooldownIndex = uint16(_cooldownIndex);
		if (cooldownIndex > 13) {
			cooldownIndex = 13;
		}
		LinglongCat memory _LinglongCat = LinglongCat({
			genes: _genes,
			birthTime: uint64(_time),
			cooldownEndBlock: 0,
			matronId: uint32(_matronId),
			sireId: uint32(_sireId),
			siringWithId: 0,
			cooldownIndex: cooldownIndex,
			generation: uint16(_generation)
			});
		uint256 newLinglongCatId = LinglongCats.push(_LinglongCat) - 1;
		// It's probably never going to happen, 4 billion LinglongCats is A LOT, but
		// let's just be 100% sure we never let this happen.
		require(newLinglongCatId == uint256(uint32(newLinglongCatId)));
		// emit the birth event
		Birth(
			_owner,
			newLinglongCatId,
			uint256(_LinglongCat.matronId),
			uint256(_LinglongCat.sireId),
			_LinglongCat.genes,
            uint256(_LinglongCat.generation)
		);
		// This will assign ownership, and also emit the Transfer event as
		// per ERC721 draft
		_transfer(0, _owner, newLinglongCatId);
		return newLinglongCatId;
	}
}