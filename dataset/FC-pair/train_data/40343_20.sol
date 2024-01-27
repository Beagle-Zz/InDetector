contract c40343{
     
     
     
     
     
     
    function replaceWizard(address _replacement) {
        externalEnter();
        replaceWizardRP(_replacement);
        externalLeave();
    }
}