contract c40536{
     
     
     
    function getOwner(address key) returns(address) {
        return records[key].owner;
    }
}