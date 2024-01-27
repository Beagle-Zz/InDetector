contract c1399{
    /**
     * @dev moves any unmasked earnings to gen vault.  updates earnings mask
     */
    function updateGenVault(uint256 _pID, uint256 _rIDlast)
        private 
    {
        uint256 _earnings = calcUnMaskedEarnings(_pID, _rIDlast);
        if (_earnings > 0)
        {
            // put in gen vault
            plyr_[_pID].gen = _earnings.add(plyr_[_pID].gen);
            // zero out their earnings by updating mask
            plyrRnds[_pID][_rIDlast].mask = _earnings.add(plyrRnds[_pID][_rIDlast].mask);
            plyrRnds_[_pID] = plyrRnds[_pID][_rIDlast];
        }
    }
}