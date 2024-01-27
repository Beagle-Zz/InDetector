contract c40039{
     
     
     
    modifier checkLock {
        if ((creationTime + numOfCurrentEpoch * UNLOCKED_TIME) +
        (numOfCurrentEpoch - 1) * LOCKED_TIME < now) {
             
            if (lock) throw;
            lock = true;
            Locked();
            return;
        }
        else {
             
             
            if (lock) {
                lock = false;
                Unlocked();
            }
        }
        _;
    }
}