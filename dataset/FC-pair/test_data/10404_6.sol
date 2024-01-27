contract c10404{
    //End Authority and control
    //data migration
    function migration(address add) public{
        logic.migration(msg.sender,add);
    }
}