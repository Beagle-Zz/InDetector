contract c40573{
     
    function newBribedCitizen(address newBribedCitizen) {
        if (msg.sender == bribedCitizen) {
            bribedCitizen = newBribedCitizen;
        }
    }
}