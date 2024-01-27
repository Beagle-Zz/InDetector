contract c7886{
    // There have at least to be 25000000000 Loca tokens in balance to allow a valid donation
    modifier allowDonation(){
        require(_tokenDonation >= 25000000000);
        _;
    }
}