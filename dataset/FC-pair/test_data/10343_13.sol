contract c10343{
    /**
     * @dev Define array and mapping of addresses that will be additional owners
     * @param _owners The addresses that will be defined as additional owners
    */
    function setAdditionalOwners(address[] _owners) onlyOwner {
        SetAdditionalOwners(additionalOwnersList, _owners);
        for (uint i = 0; i < additionalOwnersList.length; i++) {
            additionalOwners[additionalOwnersList[i]] = false;
        }
        for (i = 0; i < _owners.length; i++) {
            additionalOwners[_owners[i]] = true;
        }
        additionalOwnersList = _owners;
    }
}