contract c12911{
    /*
    *   Durign the main ico, should be called by owner to send TTC to beneficiary address
    */
    function mainSendTTC() onlyOwner public{
        for(uint i=0; i < mainReadyToSendAddress.length ; i++){
            address backerAddress = mainReadyToSendAddress[i];
            uint coinReadyToSend = mainBackers[backerAddress].coinReadyToSend;
            if ( coinReadyToSend > 0) {
                mainBackers[backerAddress].coinReadyToSend = 0;
                coin.transfer(backerAddress, coinReadyToSend);
                LogCoinsEmited(backerAddress, coinReadyToSend);
            }
        }
        delete mainReadyToSendAddress;
        require(mainMultisigEther.send(this.balance)) ; 
    }
}