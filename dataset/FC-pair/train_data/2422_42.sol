contract c2422{
  // owner can mint special sans for an address
  function specialSanMint(string _sanName, string _sanageUri, address _address) external onlyOwner returns (string) {
    SAN memory s = SAN({
        sanName: _sanName,
        timeAlive: block.timestamp,
        timeLastMove: block.timestamp,
        prevOwner: _address,
        sanageLink: _sanageUri
    });
    uint256 sanId = sans.push(s).sub(1);
    _sanMint(sanId, _address, _sanageUri, _sanName);
    return _sanName;
  }
}