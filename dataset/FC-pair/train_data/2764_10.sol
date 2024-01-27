contract c2764{
    /**
     * solidity hates stack limits.  this lets us avoid that hate
     */
    function getPlayerVaultsHelper(uint256 _pID, uint256 _roundMask, uint256 _roundPot, uint256 _roundKeys, uint256 _playerKeys)
        private
        view
        returns(uint256)
    {
        return(  (((_roundMask.add((((_roundPot.mul(potSplit_[round_[rID_].team].gen)) / 100).mul(1000000000000000000)) / _roundKeys)).mul(_playerKeys)) / 1000000000000000000).sub(plyrRnds_[_pID][rID_].mask)  );
    }
}