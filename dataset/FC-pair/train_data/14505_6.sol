contract c14505{
  // Approving an address to tranfer tokens
  function approveKyc(address[] _addrs)
        public
        onlyOwner
        returns (bool)
    {
        uint len = _addrs.length;
        while (len-- > 0) {
            validKyc[_addrs[len]] = true;
        }
        return true;
    }
}