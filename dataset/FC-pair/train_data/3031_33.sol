contract c3031{
    /**
    * @dev get information about property
    * @param _index Index of property
    * @return Primary type, secondary type, cadastral municipality, parcel number and id of property
    **/
    function getPropertyInfo(uint8 _index) public constant returns (string, string, uint64, uint64, uint64) {
        return (properties[_index].primaryPropertyType, properties[_index].secondaryPropertyType, properties[_index].cadastralMunicipality, properties[_index].parcelNumber, properties[_index].id);
    }
}