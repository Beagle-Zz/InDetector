contract c3545{
    /**
    * @dev Allows to transfer a token to another owner
    * @param _to transfer to
    * @param _tokenId token to transfer
    */
    function transfer(address _to, uint256 _tokenId) external onlyOwnerOf(_tokenId) {
        require(_isTransferAllowed(msg.sender, _to, _tokenId));
        require(_to != address(0));
        clearApproval(msg.sender, _tokenId);
        removeTokenFrom(msg.sender, _tokenId);
        addTokenTo(_to, _tokenId);
        emit Transfer(msg.sender, _to, _tokenId);
    }
}