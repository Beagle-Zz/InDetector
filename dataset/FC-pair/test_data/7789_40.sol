contract c7789{
  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _id The NFT to be minted by the msg.sender.
   * @param _uri An URI pointing to NFT metadata.
   * @param _proof Cryptographic asset imprint.
   * @param _config Array of protocol config values where 0 index represents token expiration
   * timestamp, other indexes are not yet definied but are ready for future xcert upgrades.
   * @param _data Array of convention data values.
   */
  function mint(
    address _to,
    uint256 _id,
    string _uri,
    string _proof,
    bytes32[] _config,
    bytes32[] _data
  )
    external
    isAuthorized()
  {
    require(_config.length > 0);
    require(bytes(_proof).length > 0);
    super._mint(_to, _id);
    super._setTokenUri(_id, _uri);
    idToProof[_id] = _proof;
    config[_id] = _config;
    data[_id] = _data;
  }
}