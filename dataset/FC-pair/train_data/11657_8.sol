contract c11657{
  // function to be called when wanting to add funds to all districts
  function floatEconony() public payable onlyOwner {
        if(msg.value>0){
          for (uint district=1;district<8;district++){
              districts[district].weedPot+=(msg.value/14);
              districts[district].cokePot+=(msg.value/14);
            }
        }
    }
}