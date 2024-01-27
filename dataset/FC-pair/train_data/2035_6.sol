contract c2035{
    // public read 
    function getItemInfo(uint _tokenId) constant public returns(uint classId, uint value) {
        Item storage item = items[_tokenId];
        classId = item.classId;
        value = item.value;
    }
}