contract c40223{
     
    function getThing(bytes32[] _id) constant returns(bytes32[], bytes32[], uint88, bytes, address, bool) {
        var index = idToThing[sha3(_id)];
         
        if (index == 0) {
            Error(2, _id);
            return;
        }
        Thing thing = things[index];
        return (thing.identities, thing.data, thing.schemaIndex, schemas[thing.schemaIndex], thing.ownerAddress, thing.isValid);
    }
}