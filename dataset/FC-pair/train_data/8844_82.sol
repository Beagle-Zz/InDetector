contract c8844{
    /// @notice Returns all the relevant information about a specific LinglongCat.
    /// @param _id The ID of the LinglongCat of interest.
    function getLinglongCat(uint256 _id)
        external
        view
        returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    ) {
        LinglongCat storage cat = LinglongCats[_id];
        // if this variable is 0 then it's not gestating
        isGestating = (cat.siringWithId != 0);
        isReady = (cat.cooldownEndBlock <= block.number);
        cooldownIndex = uint256(cat.cooldownIndex);
        nextActionAt = uint256(cat.cooldownEndBlock);
        siringWithId = uint256(cat.siringWithId);
        birthTime = uint256(cat.birthTime);
        matronId = uint256(cat.matronId);
        sireId = uint256(cat.sireId);
        generation = uint256(cat.generation);
        genes = cat.genes;
    }
}