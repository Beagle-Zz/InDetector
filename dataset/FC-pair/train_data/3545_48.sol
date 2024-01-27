contract c3545{
    /**
    * @dev Allows the admin to forcefully transfer a token from one address to another
    * @param _from transfer from
    * @param _to transfer to
    * @param _tokenId token to transfer
    */
    function forceTransfer(address _from, address _to, uint256 _tokenId) external onlyLogicContract {
        require(_from != address(0));
        require(_to != address(0));
        clearApproval(_from, _tokenId);
        removeTokenFrom(_from, _tokenId);
        addTokenTo(_to, _tokenId);
        emit Transfer(_from, _to, _tokenId);
    }
}