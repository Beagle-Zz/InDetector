contract c14996{
    /*************************************************************/
    /*************** ADDING CAPITAL ******************************/
    /*************************************************************/ 
    // Anyone can add capital at any time.
    // If it comes from Comptroller, it counts as capitalRaised.
    function addCapital()
        public
        payable
    {
        capital += msg.value;
        if (msg.sender == address(comptroller)) {
            capitalRaised += msg.value;
            emit CapitalRaised(now, msg.value);
        }
        emit CapitalAdded(now, msg.sender, msg.value);
    }
}