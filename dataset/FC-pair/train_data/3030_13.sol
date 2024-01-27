contract c3030{
    /**
    * @dev connect two addresses so that they can send BSPT without fee
    * @param _from First address
    * @param _to Second address
    **/
    function addNoFeeAddress(address[] _from, address[] _to) public onlyOwner {
        require(_from.length == _to.length);
        for (uint256 i = 0; i < _from.length; i++) {
            noFeeTransfersAccounts[_from[i]] = _to[i];
            noFeeTransfersAccounts[_to[i]] = _from[i];
        }
    }
}