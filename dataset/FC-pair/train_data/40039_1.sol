contract c40039{
     
     
     
    modifier isNewEpoch {
        if (numOfCurrentEpoch * EPOCH_LENGTH + creationTime < now ) {
            numOfCurrentEpoch = (now - creationTime) / EPOCH_LENGTH + 1;
        }
        _;
    }
}