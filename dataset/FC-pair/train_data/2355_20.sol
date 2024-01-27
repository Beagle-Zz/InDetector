contract c2355{
    /**
     * Check if goal was reached
     *
     * Checks if the goal or time limit has been reached and ends the campaign
     */
    function invest(address ) public payable {
    if(requireCustomerId) revert(); // Crowdsale needs to track partipants for thank you email
    if(requiredSignedAddress) revert(); // Crowdsale allows only server-side signed participants
  }
}