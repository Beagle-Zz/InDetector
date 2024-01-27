contract c40557{
     
    function update(address key, string description, string url) {
         
        if (records[key].owner == msg.sender) {
            records[key].description = description;
            records[key].url = url;
        }
    }
}