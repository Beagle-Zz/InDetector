contract c16428{
    /**
     * release Tokens of an individual address
     */
    function releaseTokens(address _contributerAddress) onlyOwner public {
        if(isKYCRequiredToSendTokens){
             if(KycContractInterface(kycAddress).isAddressVerified(_contributerAddress)){ // if kyc needs to be checked at release time
                release(_contributerAddress);
             }
        } else {
            release(_contributerAddress);
        }
    }
}