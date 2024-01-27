contract c2436{
    /**
    * @dev Transfers the ownership of a given token ID to another address, modified to prevent transfer if attached and system is active
    */
    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    )
        public
        canTransfer(_tokenId)
    {
        require(_from != address(0));
        require(_to != address(0));
        clearApproval(_from, _tokenId);
        removeTokenFrom(_from, _tokenId);
        addTokenTo(_to, _tokenId);
        emit Transfer(_from, _to, _tokenId);
    }
}