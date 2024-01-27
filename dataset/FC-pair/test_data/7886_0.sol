contract c7886{
    // Allow the donation to start
    modifier allowStart() {
        require(_tokenDonation == 0);
        _;
    }
}