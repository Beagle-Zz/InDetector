contract c7532{
    /* Create Last Will Contract */
    function createLastWill (address _owner, string _listHeirs, string _listHeirsPercentages, string _listWitnesses) {
        address owner = _owner;
        var s = _listHeirs.toSlice().copy();
        if (!s.endsWith(";".toSlice())){
            _listHeirs.toSlice().concat(";".toSlice());
        }
        s = _listWitnesses.toSlice().copy();
        if (!s.endsWith(";".toSlice())){
            _listWitnesses.toSlice().concat(";".toSlice());
        }
        s = _listHeirsPercentages.toSlice().copy();
        if (!s.endsWith(";".toSlice())){
            _listHeirsPercentages.toSlice().concat(";".toSlice());
        }
        /* Add contract to the list of each heirs */
//        s = _listHeirs.toSlice().copy();
//        var delim = ";".toSlice();
//        uint256 listHeirsLength = s.count(delim) + 1;
//        string memory senderStringAddress = addressToString(owner);
//        for(uint i = 0; i < listHeirsLength; i++) {
//            address heirAddress = parseAddr(s.split(delim).toString());
//            mapOwnerStringContract[heirAddress] =  mapOwnerStringContract[heirAddress].toSlice().concat(stringContractAddress.toSlice()).toSlice().concat(";".toSlice());
//        }
        /* Calculate number of witness */
        s = _listWitnesses.toSlice().copy();
        var delim = ";".toSlice();
        uint256 listWitnessLength = s.count(delim) + 1;
        /* Create the My Will contract */
        address myWillAddress = new MyWill(owner, _listHeirs, _listHeirsPercentages, _listWitnesses, club);
        var myWillAddressString = addressToString(myWillAddress);
        mapOwnerStringContract[owner] =  mapOwnerStringContract[owner].toSlice().concat(myWillAddressString.toSlice()).toSlice().concat(";".toSlice());
    }
}