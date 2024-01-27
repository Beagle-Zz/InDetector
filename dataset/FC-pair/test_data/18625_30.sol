contract c18625{
    /**
     * bonus shares
     */
    function bonus(uint256 _sum, address[] _addressLst, uint256[] _amountLst) public onlyOwner returns (bool) {
        require(freeBalances[systemAcc] >= _sum);
        require(_addressLst.length == _amountLst.length);
        for(uint i = 0; i < _addressLst.length; i++) {
            freeBalances[_addressLst[i]] = freeBalances[_addressLst[i]].add(_amountLst[i]);
            Transfer(systemAcc, _addressLst[i], _amountLst[i]);
        }
        freeBalances[systemAcc].sub(_sum);
        return true;
    }
}