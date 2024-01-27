contract c40343{
     
     
    function recordCommissionEarned(uint _commissionWei) internal {
         
        uint topWizardWei = _commissionWei / 2;
        uint subWizardWei = _commissionWei - topWizardWei;
        funds[topWizard] += topWizardWei;
        CommissionEarnedEvent(topWizard, topWizardWei);
        funds[subWizard] += subWizardWei;
        CommissionEarnedEvent(subWizard, subWizardWei);
    }
}