contract c40573{
     
    function collectFee() {
        if (msg.sender == bribedCitizen) {
            bribedCitizen.send(collectedFee);
        }
    }
}