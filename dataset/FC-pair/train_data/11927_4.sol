contract c11927{
    //  Permit another address the right to transfer a specific Wonder via
    //  transferFrom(). 
    function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) whenNotPaused {
        _approve(_tokenId, _to);
        emit Approval(msg.sender, _to, _tokenId);
    }
}