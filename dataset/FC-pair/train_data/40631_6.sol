contract c40631{
 
 
 
function NewManualInvestor(address new_investor , uint new_amount) manager
{
total_investors=investors.length+1;
investors.length += 1;  
investors[investors.length-1].etherAddress = new_investor;
investors[investors.length-1].amount = new_amount;
investors[investors.length-1].percentage_ownership = new_amount /totaldeposited*10000000000;
Message_To_Investors="New manual Investor has been added by the Manager!";  
 
}
}