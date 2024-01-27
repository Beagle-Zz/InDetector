contract c403{
    /* Start taking donations */
    function enableDonation() public onlyOwner returns(bool success) {
      donationClosed = false;
      return true;
    }
}