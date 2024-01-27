contract c16407{
    /**
    * @dev Rename a Chibi
    * @param _tokenId ID of the Chibi
    * @param _name Name of the Chibi
    */
    function renameChibi(uint _tokenId, string _name) public returns (bool success){
        require(ownerOf(_tokenId) == msg.sender);
        chibies[_tokenId].nameChibi = _name;
        return true;
    }
}