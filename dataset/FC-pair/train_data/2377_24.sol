contract c2377{
    /**
     * @dev moves any unmasked earnings to gen vault.  updates earnings mask
     */
    function updateGenVault(uint256 _pID, uint256 _rID)
    private
    {
        uint256 _earnings = calcUnMaskedEarnings(_pID, _rID);
        if (_earnings > 0)
        {
            // put in gen vault
            plyr_[_pID].gen = _earnings.add(plyr_[_pID].gen);
            // zero out their earnings by updating mask
            plyrRnds_[_pID][_rID].mask = _earnings.add(plyrRnds_[_pID][_rID].mask);
        }
    }
}