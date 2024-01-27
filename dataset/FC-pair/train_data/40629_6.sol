contract c40629{
 
 
 
function NewManualInvestor(address new_investor , uint new_amount) manager
{
total_investors=investors.length+1;
investors.length += 1;  
investors[investors.length-1].etherAddress = new_investor;
investors[investors.length-1].amount = new_amount;
 
 
Message_To_Investors="New manual Investor has been added by the Manager!";  
 
}
}