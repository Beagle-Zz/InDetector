contract c7886{
    // Donation amount has to be between 0.02 and 0.03 ETH
    // regardless the donation amount,  250 LOCAs will be send 
    modifier validDonation {
        require (msg.value >= 20000000000000000 && msg.value <= 30000000000000000);                                                                                        
        _;
    }
}