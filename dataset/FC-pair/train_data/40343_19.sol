contract c40343{
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    function claimThrone(string _monarchName) {
        externalEnter();
        claimThroneRP(_monarchName);
        externalLeave();
    }
}