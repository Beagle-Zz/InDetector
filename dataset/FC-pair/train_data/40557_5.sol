contract c40557{
     
     
     
    function getTime(address key) private constant returns(uint) {
        return records[key].time;
    }
}