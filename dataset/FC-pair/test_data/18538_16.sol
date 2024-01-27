contract c18538{
//
//  clear KYC onchain
//
    function clearKyc(address[] _addrs)
        public
        noReentry
        onlyOwner
        returns (bool)
    {
        uint len = _addrs.length;
        for(uint i; i < len; i++) {
            clearedKyc[_addrs[i]] = true;
            emit Kyc(_addrs[i], true);
        }
        return true;
    }
}