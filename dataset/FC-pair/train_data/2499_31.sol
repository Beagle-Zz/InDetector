contract c2499{
    // Checks whether the minting is allowed or not, check for the owner if owner is no the msg.sender then check
    // for the finishedSTOMinting flag because only STOs and owner are allowed for minting
    modifier isMintingAllowed() {
        if (msg.sender == owner) {
            require(!finishedIssuerMinting, "Minting is finished for Issuer");
        } else {
            require(!finishedSTOMinting, "Minting is finished for STOs");
        }
        _;
    }
}