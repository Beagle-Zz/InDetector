contract c385{
    /* Stop taking donations */
    function disableDonation() public onlyOwner returns(bool success) {
      donationClosed = true;
      return true;
    }
}