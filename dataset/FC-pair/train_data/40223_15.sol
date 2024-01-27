contract c40223{
     
    function createThings(bytes32[] _ids, uint16[] _idsPerThing, bytes32[] _data, uint16[] _dataLength, uint88 _schemaIndex) isRegistrant noEther  {
         
        uint16 idIndex = 0;
         
        uint16 dataIndex = 0;
         
        uint24 idCellsPerThing = 0;
         
        uint16 urnNamespaceLength;
         
        uint24 idLength;
         
        for (uint16 i = 0; i < _idsPerThing.length; i++) {
             
            idCellsPerThing = 0;
             
            for (uint16 j = 0; j < _idsPerThing[i]; j++) {
                urnNamespaceLength = uint8(_ids[idIndex + idCellsPerThing][0]);
                idLength =
                     
                    uint16(_ids[idIndex + idCellsPerThing + (urnNamespaceLength + 1) / 32][(urnNamespaceLength + 1) % 32]) * 2 ** 8 |
                     
                    uint8(_ids[idIndex + idCellsPerThing + (urnNamespaceLength + 2) / 32][(urnNamespaceLength + 2) % 32]);
                idCellsPerThing += (idLength + urnNamespaceLength + 3) / 32;
                if ((idLength + urnNamespaceLength + 3) % 32 != 0) {
                    idCellsPerThing++;
                }
            }
             
            bytes32[] memory ids = new bytes32[](idCellsPerThing);
             
            for (j = 0; j < idCellsPerThing; j++) {
                ids[j] = _ids[idIndex++];
            }
            bytes32[] memory data = new bytes32[](_dataLength[i]);
            for (j = 0; j < _dataLength[i]; j++) {
                data[j] = _data[dataIndex++];
            }
            createThing(ids, data, _schemaIndex);
        }
    }
}