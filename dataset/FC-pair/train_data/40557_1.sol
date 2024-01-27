contract c40557{
     
    function addGame(address key, string description, string url) {
         
        if (msg.value < REGISTRATION_COST) {
             
            if (msg.value > 0) {
                msg.sender.send(msg.value);
            }
            return;
        }
        distributeValue();
        if (records[key].time == 0) {
            records[key].time = now;
            records[key].owner = msg.sender;
            records[key].keysIndex = keys.length;
            keys.length++;
            keys[keys.length - 1] = key;
            records[key].description = description;
            records[key].url = url;
            numRecords++;
        }
    }
}