contract c3807{
    /**
    * @dev DEV - change the number of required signatures.  must be between
    * 1 and the number of admins.  this is a dev only function
    * @param _howMany - desired number of required signatures
    */
    function changeRequiredSignatures(uint256 _howMany)
        public
        onlyDevs()
    {  
        // make sure its between 1 and number of admins
        require(_howMany > 0 && _howMany <= adminCount_, "changeRequiredSignatures failed - must be between 1 and number of admins");
        if (MSFun.multiSig(msData, requiredDevSignatures_, "changeRequiredSignatures") == true) 
        {
            MSFun.deleteProposal(msData, "changeRequiredSignatures");
            // store new setting.
            requiredSignatures_ = _howMany;
        }
    }
}