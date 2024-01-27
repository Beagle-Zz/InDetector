contract c40012{
     
    modifier onlyMainPartner {if (msg.sender !=  FundingRules[0].mainPartner) throw; _;}
}