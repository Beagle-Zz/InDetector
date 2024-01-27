contract c18536{
//
//  re-instate KYC onchain, should circumstances change
//
    function requireKyc(address[] _addrs)
        public
        noReentry
        onlyOwner
        returns (bool)
    {
        uint len = _addrs.length;
        for(uint i; i < len; i++) {
            delete clearedKyc[_addrs[i]];
            emit Kyc(_addrs[i], false);
        }
        return true;
    }
}