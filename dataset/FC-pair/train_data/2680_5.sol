contract c2680{
    // public write 
    function useSingleItem(uint _tokenId, uint _target, uint _param) isActive requireAdventureHandler public {
        // check ownership
        if (_tokenId == 0 || tokenOwner[_tokenId] != msg.sender) revert();
        Item storage item = items[_tokenId];
        EtheremonAdventureHandler handler = EtheremonAdventureHandler(adventureHandler);
        handler.handleSingleItem(msg.sender, item.classId, item.value, _target, _param);
        _burn(msg.sender, _tokenId);
    }
}