contract c40344{
     
     
    function isLivingMonarch() constant returns (bool alive) {
        if (numberOfMonarchs() == 0) {
            return false;
        }
        uint reignStartedTimestamp = latestMonarchInternal().coronationTimestamp;
        if (now < reignStartedTimestamp) {
             
             
             
            return true;
        }
        uint elapsedReignDurationSeconds = now - reignStartedTimestamp;
        if (elapsedReignDurationSeconds > rules.curseIncubationDurationSeconds) {
            return false;
        } else {
            return true;
        }
    }
}