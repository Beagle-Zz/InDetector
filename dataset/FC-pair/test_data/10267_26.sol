contract c10267{
    /// For checking approval of transfer for address _to
    function _approved(address _to, uint256 _tokenId) private view returns (bool) {
        return countryIndexToApproved[_tokenId] == _to;
    }
}