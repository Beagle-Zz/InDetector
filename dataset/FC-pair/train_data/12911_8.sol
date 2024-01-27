contract c12911{
    /*
    *   Durign the pre ico, should be called by owner to send TTC to beneficiary address
    */
    function preSendTTC() onlyOwner public {
        for(uint i=0; i < preReadyToSendAddress.length ; i++){
            address backerAddress = preReadyToSendAddress[i];
            uint coinReadyToSend = preBackers[backerAddress].coinReadyToSend;
            if ( coinReadyToSend > 0) {
                preBackers[backerAddress].coinReadyToSend = 0;
                coin.transfer(backerAddress, coinReadyToSend);
                LogCoinsEmited(backerAddress, coinReadyToSend);
            }
        }
        delete preReadyToSendAddress;
        require(preMultisigEther.send(this.balance)) ; 
    }
}