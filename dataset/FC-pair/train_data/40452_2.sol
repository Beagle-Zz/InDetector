contract c40452{
     
     
    function register() {
       
      uint etherPaid = msg.value;
      if(etherPaid < registrationFee) { throw; }
       
      uint sellerId = sellers.length;
      sellers.length += 1;
       
      sellers[sellerId].etherAddress = msg.sender;
      sellers[sellerId].averageRating = 0;
       
      sellerLookup[msg.sender] = sellerId;
    }
}