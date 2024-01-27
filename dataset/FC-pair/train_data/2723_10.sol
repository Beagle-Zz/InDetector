contract c2723{
    /**
     * solidity hates stack limits.  this lets us avoid that hate 
     */
    function getPlayerVaultsHelper(uint256 _pID)
        private
        view
        returns(uint256)
    {
        return(  ((((round_.mask).add(((((round_.pot).mul(potSplit_)) / 100).mul(1000000000000000000)) / (round_.keys))).mul(plyrRnds_[_pID].keys)) / 1000000000000000000)  );
    }
}